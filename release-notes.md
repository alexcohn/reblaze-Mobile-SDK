Version 1.6

2020-06-01

- Android AAR is now distributed via Maven repository and iOS SDK is now integrated via CocoaPods;
- Method signatures and error messages do match between iOS and Android;
- Now SDK version and device id are sent as an header on both iOS and Android;
- Possible Android memory leak issue was fixed;
- Android SDK Crash for paticular devices was fixed

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
