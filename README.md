# ToastView

ToastView is a lightweight and highly customizable toast view for iOS. It allows you to display transient notifications with images, text, and styling options. Perfect for providing quick user feedback in your app.

![ToastView Example](![IMG_0135](https://github.com/user-attachments/assets/2f7660e5-1ad2-4a39-a6be-e9ee4b680349))

## Features

- Customizable background color, text color, font, and border.
- Supports images and text in the toast.
- Adjustable position (`top` or `bottom`).
- Smooth animations for presenting and dismissing the toast.
- Easy to integrate into any iOS project.

---

## Installation

### CocoaPods

To integrate `ToastView` into your Xcode project using CocoaPods, add the following to your `Podfile`:

```ruby
pod 'ToastView', '~> 0.0.1'

```
Then run the following command in the terminal:

```ruby
pod install

```

Swift Package Manager (SPM)
You can also integrate ToastView using Swift Package Manager. Follow these steps:

1. In Xcode, go to File > Add Packages....
2. Enter the repository URL:

```ruby
https://github.com/AliHasnatTahir/ToastView
```

3. Select the version you want and click Add Package.


## Usage
### Basic Usage
Import the ToastView library:

```ruby
import ToastView
```

Display a toast with an image and text:
```ruby
ToastView.showToast(
    in: self.view,
    image: UIImage(named: "icon"),
    text: "Hello, World!",
    font: UIFont.systemFont(ofSize: 14),
    position: .bottom,
    duration: 2.0,
    backgroundColor: .black,
    textColor: .white,
    bordorColor: .white,
    borderWidth: 2
)

```

## Customizing Toast Appearance
- Position: Display the toast at the top or bottom of the screen by setting the position parameter (.top or .bottom).
- Duration: Set the duration (in seconds) for which the toast is displayed using the duration parameter.
- Colors and Borders: Customize backgroundColor, textColor, bordorColor, and borderWidth for the toast.


## Contributing
Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push them to your fork.
4. Submit a pull request.

## License
ToastView is released under the MIT License. You are free to use it in your own projects.

## Author
### Ali Hasnat Tahir

- GitHub: https://www.github.com/AliHasnatTahir
- Email: alihasnat861@gmail.com
- Linkedin: www.linkedin.com/in/ali-hasnat


Let me know if you need help setting up your repository or making adjustments!
