# PopularArtical
Swift Assessment Test 

## Building And Running The Project (Requirements)
* Swift 5.0+
* SwiftUI
* Xcode 14.2+
* iOS 16.2+
* MacOS Monterey 12.6

# Getting Started
- If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to setup Xcode and Swift on your Mac.


## Setup Configs
- Checkout master branch to run latest version
- Open the project by double clicking the `NYPostPopularArtical.xcodeproj` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = NYPostPopularArtical
PRODUCT_BUNDLE_IDENTIFIER = com.ny.NYPostPopularArtical

#targets:
* NYPostPopularArtical
* NYPostPopularArticalTests

```

# Build and or run application by doing:
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app


## Accomplished:
- SOLID principle.
- Obfuscation.
- JailBroken Detection.
- SSL Pinning.
Without any implementation of third party libraries.

## Architecture
This application uses the Model-View-ViewModel (refered to as MVVM) UI architecture,


## Structure

### Modules
- Include 
	*ArticleList, 
	*ArticalDetail.

### Common
- Include Constants, ImageLoader, ImageCache, AsyncImage, LazyView

### Network
- Include Security, APIError, FetchAPI, RequestAPI

#### screen shots:

![Simulator Screen Shot - iPhone 14 Pro - 2023-04-28 at 17 47 04](https://user-images.githubusercontent.com/58474263/235167390-d8ebce60-3a0e-4da1-99a9-6483c6af1c56.png)

![Simulator Screen Shot - iPhone 14 Pro - 2023-04-28 at 17 47 09](https://user-images.githubusercontent.com/58474263/235167646-aad90f5f-0050-46c9-b104-1de69524096a.png)

![Simulator Screen Shot - iPhone 14 Pro - 2023-04-28 at 18 07 47](https://user-images.githubusercontent.com/58474263/235170288-f8b175f1-8078-4266-a771-ef03d3425e76.png)

![Simulator Screen Shot - iPhone 14 Pro - 2023-04-28 at 17 47 35](https://user-images.githubusercontent.com/58474263/235167715-207a4a4e-7c12-46bf-a4ea-af595b74965e.png)
