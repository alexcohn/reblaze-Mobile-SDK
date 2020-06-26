Version 1.7

2020-06-26

- User agent string argument in SDK init/start method was added for iOS and Android;
- ios-xcode11 example app was fixed;
- SDK provides logging via os_log for iOS;
- Added detailed documentation for possible error throwing in methods Reblaze.start and getHash for iOS and Android;
- Cocoapods and Maven distribution documentation was updated;
- reportLocation parameter was added iOS and Android;
- doublecheck was added that native library loaded in start() method for Android;
- An issue on getting the location (isUseLocationPermission) was fixed for Android;
- iOS SDK can accept correct values for interval now;


Version 1.6

2020-06-01

- Added Maven repository support for Android and CocoaPods for iOS;
- Method signatures and error messages match between iOS and Android;
- SDK version and device id are sent in the header on both iOS and Android;
- Android memory leak issue fixed;
- Android SDK crash fixed;

Version 1.5.1

2020-04-23

- Added option to set custom time interval for events sending for iOS and Android;
- Added option to switch events sending off for iOS and Android.
- Removed some domain artifacts for iOS and Android.
- Fixed Reblaze SDK is not asking for location permissions for Android

Version 1.4

2020-03-23
 
- Indication whether application is running in emulator or real device was added for iOS and Android;
- Battery level report were added for iOS and Android;
- Location used flag was added for iOS and Android;
- HostnameVerifier error when uploading Android app using Reblaze SDK was fixed;
- sendEvent method is fixed in iOS version of SDK.
