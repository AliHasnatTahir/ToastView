//
//  ToastView.swift
//  ToastView
//
//  Created by Ali Hasnat on 28/12/2024.
//

import UIKit

class ToastView: UIView {
    
    enum Position {
        case top
        case bottom
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.textColor = .white
        return label
    }()
    
    init(image: UIImage?, text: String, font: UIFont) {
        super.init(frame: .zero)
        setupView()
        configure(withImage: image, text: text, font: font)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        addSubview(imageView)
        addSubview(label)

        backgroundColor = .systemBlue
        clipsToBounds = true

        let height = UIDevice.current.userInterfaceIdiom == .pad ? 80 : 60
        layer.cornerRadius = CGFloat(height / 2)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        let imageSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 50 : 30

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: imageSize),
            imageView.heightAnchor.constraint(equalToConstant: imageSize),

            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),

            heightAnchor.constraint(equalToConstant: CGFloat(height))
        ])
    }
    
    private func configure(withImage image: UIImage?, text: String, font: UIFont) {
        imageView.image = image
        label.text = text
        label.font = font

        invalidateIntrinsicContentSize()
    }
    
    override var intrinsicContentSize: CGSize {
        let imageSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? 50 : 30
        let labelWidth = label.intrinsicContentSize.width
        let totalWidth = 10 + imageSize + 10 + labelWidth + 10
        let height = UIDevice.current.userInterfaceIdiom == .pad ? 80 : 60
        return CGSize(width: totalWidth, height: CGFloat(height))
    }
    
    static func showToast(
        in parentView: UIView,
        image: UIImage?,
        text: String,
        font: UIFont,
        position: Position = .bottom,
        duration: TimeInterval = 2.0,
        backgroundColor: UIColor,
        textColor: UIColor,
        bordorColor: UIColor,
        borderWidth: CGFloat
    ) {
        let toast = ToastView(image: image, text: text, font: font)
        toast.backgroundColor = backgroundColor
        toast.label.textColor = textColor
        toast.alpha = 0.0
        toast.layer.borderColor = bordorColor.cgColor
        toast.layer.borderWidth = borderWidth
        parentView.addSubview(toast)
        toast.translatesAutoresizingMaskIntoConstraints = false

        let safeArea = parentView.safeAreaLayoutGuide
        let height = UIDevice.current.userInterfaceIdiom == .pad ? 80 : 60
        let yOffset: CGFloat = 16

        var startConstraint: NSLayoutConstraint
        var endConstraint: NSLayoutConstraint
        
        if position == .top {
            startConstraint = toast.bottomAnchor.constraint(equalTo: safeArea.topAnchor)
            endConstraint = toast.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: yOffset)
        } else {
            startConstraint = toast.topAnchor.constraint(equalTo: safeArea.bottomAnchor)
            endConstraint = toast.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -yOffset)
        }

        NSLayoutConstraint.activate([
            toast.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
            toast.heightAnchor.constraint(equalToConstant: CGFloat(height)),
            startConstraint
        ])
        
        parentView.layoutIfNeeded()

        startConstraint.isActive = false
        endConstraint.isActive = true

        UIView.animate(withDuration: 0.5, animations: {
            toast.alpha = 1.0
            parentView.layoutIfNeeded()
        }) { _ in
            UIView.animate(withDuration: 0.5, delay: duration, animations: {
                toast.alpha = 0.0
                endConstraint.isActive = false
                startConstraint.isActive = true
                parentView.layoutIfNeeded()
            }) { _ in
                toast.removeFromSuperview()
            }
        }
    }
}

