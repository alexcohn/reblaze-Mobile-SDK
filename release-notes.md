# Version 1.9.4
*2021-02-25*

## Fixes

- **Android**

    - Fixed a glitch with entering ActionMode in some use cases
    
---

# Version 1.9.3
*2021-1-16*

## Fixes

- **Android**

    - Fixed a rare NPE in KeyStoreWrapper.getPublicKey() on some devices
    - Removed the call to getAdvertisingIdInfo()

---

# Version 1.9.2
*2020-10-12*

## What’s New

- **Android and iOS**

    - For offline testing, use `mock:` URL scheme instead of `https:`. The SDK will pretend to successfully deliver all events at regular times.

    - The SDK produces no logs unless requested. When `shouldShowLogs` is specified, the SDK uses system logger (*`os_log`* on iOS, *`android.util.Log`* on Android).

    - `stop()` is no longer required. It can be called at any time to completely disable the SDK, but changing configuration or *(Android)* switching **Activity** works even without explicit calls to this API.

## Fixes

- **Android**

    - Location is updated timely (when enabled).

    - The SDK will no longer access the Location Service when `reportLocation` is not required.

- **iOS**

    - Fixed wrong calculation of `getHash()`.

    - The Events will not be sent while there is no user activity (for *Android* this was been fixed earlier).

---

# Version 1.9.1
*2020-09-14*

## Fixes

- **Android**

    - Fixed an issue where `getHash()` was not always returning consistent signatures when the same timestamp was submitted multiple times.

---

# Version 1.9
*2020-09-09*

## Fixes

- **Android and iOS**

    - Restructured example files and folders for React Native.

- **iOS**

    - Fixed an issue where the `reportLocation` parameter was not being respected if it was set multiple times.

---

# Version 1.8.2
*2020-08-13*

## Fixes

- **iOS**

    - Fixed a crash that could occur when calling `sendEvent()`.

---

# Version 1.8.1
*2020-08-11*

## What’s New

- **Android and iOS**

    - SDK initialization now supports the earlier (before v1.8) configuration procedure which called the `start()` method without calling `configure()`. The options are now as follows:

         - For authenticating client requests without sending biometric events, the `configure()` method should be called.

         - If client authentication and biometric events are desired, then any one of these three approaches can be used:

              - Call `start()` with all parameters. (_This is the approach from before v1.8, and is now being supported again as of v1.8.1._)

              - Call `configure()` first, then call `start()` with all parameters. (_This approach was added in v1.8._)

              - Call `configure()` first, then call `start()` without the parameters that are supplied in the call to `configure()`. (_This option is new for v1.8.1._)

---

# Version 1.8
*2020-07-30*

## What’s New

- **Android and iOS**

    - Secret keys are now stored using OS-specific secure storage.

    - SDK initialization is now done with two methods (instead of using `start()`, as was done previously):

         - For authenticating client requests without sending biometric events, the new `configure()` method should be used.

         - If biometric events are also desired, both `configure()` and `start()` should be called.

## Fixes

- **Android and iOS**

    - Fixed an issue where a thread kept running when the user did not close the application, but merely suspended/backgrounded it.

- **Android**

    - Removed a memory leak.

    - Fixed an issue where the SDK was not collecting/reporting user events after the Activity was recreated.


---

# Version 1.7.2
*2020-07-08*

## What’s New

- **Android and iOS**
    - In the `start()` method, the `userAgent` string argument is now optional. If it was not passed, a default value will be used.

## Fixes

- **Android and iOS**
    - Updated code samples and documentation, removing the default use of Reblaze's QA servers.
    - Updated documentation to clarify that in the `start()` method, the `userAgent` argument can be used however the customer wants.

- **iOS**
    - Fixed an issue with `getHash()`; the method was not returning consistent signatures when the same timestamp was submitted.


---

# Version 1.7
*2020-06-26*

## What’s New
- **Android and iOS**
    - In the `start()` method, the client app now supplies a string containing the user agent. Reblaze will use this for reports and events.
    - In the `start()` method, the client app now supplies a `reportLocation` parameter. This allows (or prevents) the SDK from accessing and reporting the user’s location.
    - Added documentation of possible errors thrown by `start()` and `getHash()` methods.

- **Android**
    - Updated documentation for Maven distribution.

- **iOS**  
    - The SDK now sends log messages to os_log.
    - Updated documentation for Cocoapods distribution.


## Fixes

- **Android**
    - Added handling for potential exception thrown by `isUseLocationPermission` method (when a weak reference to the location permission is null).
    - Added verification that the native library is loaded in the `start()` method.

- **iOS**  
    - Boundary values for `start()` method argument `intervalInSeconds` are now being accepted correctly.
    - The ios-xcode11-obj-c example app is now working properly.


---

# Version 1.6
*2020-06-01*

## What’s New

- **Android and iOS**
    - Method signatures and error messages are now the same for both SDK versions.
    - Sent requests now include the SDK version and device ID.

- **Android**
    - Added integration with Maven.

- **iOS**  
    - Added integration with CocoaPods.


## Fixes

- **Android**
    - Fixed a memory leak that occurred when a new main screen instance was created.
    - Added ReLinker support to fix a `java.lanq.UnsatisfiedLinkError`. More info: https://app.gitbook.com/@reblaze-2/s/product-manual/v/v2.14/using-the-product/reblaze-api-1/mobile-sdk#android

---

# Version 1.5.1
*2020-04-23*

## What’s New

- **Android and iOS**
    - Added option to set custom time interval for sending events.
    - Added option to turn off the sending of events.

## Fixes

- **Android and iOS**
    - Fixed an issue where the SDK was reverting to a default domain if the domain specified by the host application was not available. Now the SDK produces an error instead.

- **Android**
    - Fixed an issue where the SDK was incorrectly requesting location permissions.


---

# Version 1.4
*2020-03-23*

## What’s New

- **Android and iOS**
    - Host application can now indicate if it has permission to use location services.
    - Added reporting of battery level and charging mode.
    - Added reporting of whether app is running in an emulator or an actual device.

## Fixes

- **Android**
    - Fixed a HostnameVerifier error when uploading an Android app.

- **iOS**
    - Fixed an issue where the `sendEvent()` method was unavailable in Swift.

---
