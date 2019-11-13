## Description 

Reblaze mobile clients sdk's repository

This is the IOS branch where you can find the hosting app (currently including just a form in a UIViewController)

Library code has remarks inside for each method - and ill give a quick overview of what done. Library got a main starting point to activate the SDK :

    Reblaze.start(
        with: "<YOUR APPLICATION HOST>", 
        secret: "<YOUR SECRET HERE>", 
        header_name: "<Header Name>", 
        header_value: "<Header Value>")

For example:

    Reblaze.start(
      with: "https://api.example.com", 
      secret: "abcd1234", 
      header_name: "UserName", 
      header_value: "test@123.io")
      
url for the developer account server developer secret. unique key name unique key value.

Best practce is to have it on AppDelegate. Keep note that reblaze class is static so you can call it from everywhere in the app.

To send custom event you can use :  Reblaze.sendEvent(eventName: "Test ButtonClick") with event name.

The Library work's with a thread sending all events gathered from app including custom events to reblaze servers every 12 seconds.


# ReblazeIOSExampleApp
Reblaze example app with compiled library.
To use the example app just download or clone it, build and run the application. 

# installation process
To install ReblazeSDK you can find "ReblazeSDK.framework" inside the example app folder.
Instructions below. 

## Let’s add it into your project
Copy/Drag the Universal Framework to this project. While coping the framework in Project Explorer, check “Copy items if needed”.

Select the Project, Choose Target → Project Name → Select General → Scroll to “Embedded Binaries”. Press “+” and Add the framework.

# Remember
Ee we need to remove unused architectures. 
Because Apple doesn’t allow the application with unused architectures to the App Store.
Please make sure that you have Remove Unused Architectures Script added in your project while releasing your app to app store.

## Remove Unused Architectures
Select the Project, Choose Target → Project Name → Select Build Phases → Press “+” → New Run Script Phase → Name the Script as “Remove Unused Architectures Script”.

```
FRAMEWORK="TestFramework"
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
Reblaze.start(with: "https://mobilesdkqa.prod2.reblaze.com", secret: "08679d101bb5d41sdj4321b15asdfe4", header_name: "UserName", header_value: "test@123.io")
```

## Send custom event
```swift
Reblaze.sendEvent(eventName: "SomeEventName")

## UI Tests
The example app include a UI Test, to run it press "CMD + U" 
to record a new test just press record button inside the test function
