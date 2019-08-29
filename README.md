
![Cocoapods platforms](https://img.shields.io/cocoapods/p/RNAlertController.svg)
![Cocoapods](https://img.shields.io/cocoapods/v/RNAlertController.svg)
![GitHub release](https://img.shields.io/github/release/rayhannabi/RNAlertController.svg)

# RNAlertController

An easy-to-use alert library for iOS written purely in Swift. With native look-n-feel and animations, you can add more functionalities to your alerts. 

## Feature

* Title
* Description message
* Image below the description message
* Header Image (coming soon)
* Fixed header image for situation based alert such as *error*, *warning*, *information*, *done* etc. (coming soon)
* Multiple buttons with closure action
* Picker view
* URL Button

## Requirements

* iOS 9.0+
* Xcode 10+
* Swift 5
* Objective-C 2.0 (ARC required)

## Installation

### Via Cocoapods
**RNAlertController** is available through [CocoaPods](https://cocoapods.org/pods/RNAlertController). To install the latest version, simply add the following line to your Podfile:

```ruby
# Swift 5.0 or later
pod 'RNAlertController'
```
and run `pod install`

## Usage

RNAlertController is simple to use. The following example shows how to create a simple alert with an OK button within a view controller.

### Swift
```swift
let alertController = RNAlertController(title: "Message", message: "This is a demo")
alertController.addButton(title: "Got It", type: .default)
alertController.show()
```

### Objective-C
```objc
RNAlertController *alert = [[RNAlertController alloc] initWithTitle:@"Message" 
                                                            message:@"This is a demo"];
[alert addButtonWithTitle:@"Got It" type:AlertButtonTypeDefault action:nil];
[alert showWithCompletion:nil];
```

You can also specify button styles when adding them.

The following example shows how to create an alert with message and image.

### Swift

```swift
RNAlertController(title: "Message", message: "This is a demo")
    .addButton(title: "Cancel", type: .cancel, action: nil)
    .addButton(title: "Delete", type: .destructive, action: { [weak self] in
        self?.performSomeAction()
    })
    .setBannerImage(UIImage(named: "Flag")!)
    .show()
```

### Objective-C

```objc
RNAlertController *alert = [[RNAlertController alloc] initWithTitle:@"Message"
                                                            message:@"This is a demo"];
[alert addButtonWithTitle:@"Cancel" type:AlertButtonTypeCancel action:nil];
[alert addButtonWithTitle:@"Delete" type:AlertButtonTypeDestructive action:^{
    [self performSomeAction];
}];
[alert setBannerImage:[UIImage imageNamed:@"Flag"]];
[alert showWithCompletion:nil];
```


## Contributing

- If you **need help** or you'd like to **ask a general question**, open an issue.
- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.



## License

This project is available under **MIT** License. See the LICENSE file for more info
