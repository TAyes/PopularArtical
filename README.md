# PopularArtical
Swift Assessment Test 

## Building And Running The Project (Requirements)
* Swift 5.0+
* SwiftUI
* Xcode 14.2+
* iOS 16.2+

# Getting Started
- If this is your first time encountering swift/ios development, please follow [the instructions](https://developer.apple.com/support/xcode/) to setup Xcode and Swift on your Mac.


## Setup Configs
- Checkout master branch to run latest version
- Open the project by double clicking the `NYPostPopularArtical.xcodeproj` file
- Select the build scheme which can be found right after the stop button on the top left of the IDE
- [Command(cmd)] + R - Run app
```
// App Settings
APP_NAME = WeatherForecast
PRODUCT_BUNDLE_IDENTIFIER = com.ny.NYPostPopularArtical

#targets:
* NYPostPopularArtical
* NYPostPopularArticalTests

```

# Build and or run application by doing:
* Select the build scheme which can be found right after the stop button on the top left of the IDE
* [Command(cmd)] + B - Build app
* [Command(cmd)] + R - Run app

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
