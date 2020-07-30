## Description 

Reblaze mobile clients sdk's repository

This is the IOS branch where you can find the hosting app (currently including just a form in a UIViewController)

Library code has remarks inside for each method - and ill give a quick overview of what done. Library got a main starting point to configure the SDK :

[Reblaze configureWithSecret:@"secret"
              uid:@"user_id"
            error: &startError];

where
- secret : Secret value issued to the customer by Reblaze
- uid : The value for the field specified above. (For example, the user's email address.)

Then you can call getHash() method to get hash  or activate SDK for collecting and sending events using folliwing method:

[Reblaze startWith:@"server_url"
               secret:@"secret"
                  key:@"user_name"
                  uid:@"user_id"
       shouldShowLogs:YES
    intervalInSeconds: 15
            userAgent: @"user_agent"
       reportLocation: false
                error: &startError];
                
where
- address : URL for the customer's application server
- secret : Secret value issued to the customer by Reblaze
- key : The name of a field that contains a unique value for this user. (Example: UserName.)
- uid : The value for the field specified above. (For example, the user's email address.)
- shouldShowLogs : Value indicating will logs be printed in debug console
- intervalInSeconds : interval in seconds when the events will be sent. Must be in range 12...300 seconds. If value specified to -1, this means no events will be send authomatically
- userAgent: custom user agent will be send in requests, optional. If parameter is nil there will be used default value
- reportLocation: value indicating will location data be reported or not

 Or you can start without user agent, there will be used default value:
   
 [Reblaze startWith:@"server_url"
            secret:@"secret"
               key:@"user_name"
               uid:@"user_id"
    shouldShowLogs:YES
 intervalInSeconds: 15
    reportLocation: false
             error: &startError];


Please replace placeholder values with your own credenials.

Possible errors could be thrown:
 - didntStartSDK - means you try to call method that could be called only after reblaze was set up in configure() method
 - emptyUId - means you try to pass empty unique value for this user
 - emptyKey - means you try to pass empty name of a field that contains a unique value for this user
 - emptySecret - means you try to pass empty secret value issued to the customer by Reblaze
 - emptyAddress - means you try to pass empty URL for the customer's application server
 - emptyUserAgent - means you try to pass empty custom user agent
 - incorrectTimeInterval - means you try to pass incorrect time interval(outside range 12...300 sec)

Best practce is to have it on AppDelegate. Keep note that reblaze class is static so you can call it from everywhere in the app.

To send custom event you can use :  Reblaze.sendEvent(eventName: "Test ButtonClick") with event name.

The Library work's with a thread sending all events gathered from app including custom events to reblaze servers every 12 seconds.(You could set custom interval or disable this feature by passing -1)

To handle network error, subscribe to notification ReblazeErrorNotification and in object you will get either NSURLErrorDomain or NetworkResponseError with error code and description

Before call method configure() again, method stop()  should be called.

# ReblazeIOSExampleApp
Reblaze example app with compiled library.
To use the example app just download or clone it, build and run the application. 

# Installation process

## Using CocoaPods:
  use_frameworks!
  pod 'Reblaze', :git => 'https://bitbucket.org/reblaze/mobilesdk'

## Manually:
* Drag /libs/iOS/ReblazeSDK.xcframework to your project in the Project Navigator.
* Select your project and then your app target. Open the General panel.
* In Frameworks, Libraries and Embedded Content add  ReblazeSDK.xcframework and mark as Embed and Sign
* import ReblazeSDK whenever you want to use it

# Remember
Ee we need to remove unused architectures. 
Because Apple doesn’t allow the application with unused architectures to the App Store.
Please make sure that you have Remove Unused Architectures Script added in your project while releasing your app to app store.

## Remove Unused Architectures
Select the Project, Choose Target → Project Name → Select Build Phases → Press “+” → New Run Script Phase → Name the Script as “Remove Unused Architectures Script”.

```
FRAMEWORK="ReblazeSDK"
FRAMEWORK_EXECUTABLE_PATH="${BUILT_PRODUCTS_DIR}/${FRAMEWORKS_FOLDER_PATH}/$FRAMEWORK.framework/$FRAMEWORK"
EXTRACTED_ARCHS=()

for ARCH in $ARCHS
do
    lipo -extract "$ARCH" "$FRAMEWORK_EXECUTABLE_PATH" -o "$FRAMEWORK_EXECUTABLE_PATH-$ARCH"
    EXTRACTED_ARCHS+=("$FRAMEWORK_EXECUTABLE_PATH-$ARCH")
done

lipo -o "$FRAMEWORK_EXECUTABLE_PATH-merged" -create "${EXTRACTED_ARCHS[@]}"
rm "${EXTRACTED_ARCHS[@]}"
rm "$FRAMEWORK_EXECUTABLE_PATH"
mv "$FRAMEWORK_EXECUTABLE_PATH-merged" "$FRAMEWORK_EXECUTABLE_PATH"
```

Thats all !!

This run script removes the unused Simulator architectures only while pushing the Application to the App Store.

## Usage
```swift
import ReblazeSDK
```
in you "AppDelegate" and where ever you want to send a custom event.

## Start SDK
```swift
Reblaze.start(with: "https://mobilesdkqa.prod2.reblaze.com", secret: "08679d101bb5d41sdj4321b15asdfe4", uid: "test@123.io", shouldShowLogs: true, intervalInSeconds: 20)
```
## UI Tests
The example app include a UI Test, to run it press "CMD + U" 
to record a new test just press record button inside the test function
