# Reblaze SDK (Android)

The Reblaze SDK for Android is an extension for any mobile application that monitors all native events or custom events provided by you,
all events are being sent to Reblaze every 12 seconds and can be discovered in Reblaze Console by filtering `url:/8d47`.

## Installation
To use the source code in your project, add the SDK to the application dependencies, import the SDK, and initiate the agent with your configurations.

1. Open your project in *Android Studio*
2. You can add the dependency to the project manually or import from maven repo.
    a) Manually: `file > new > import library` and select the SDK library.
    b) Or import from maven, in project build.gradle:
```groovy
allprojects {
    repositories {
        maven { url "https://api.bitbucket.org/2.0/repositories/reblaze/mobilesdk/src/releases/" }
    }
}
```
In the module build.gradle:
```groovy
    implementation 'com.reblaze.sdk:mobile-sdk:1.7.0'
```
3. Implement runtime dependencies in module build.gradle:
```groovy
    runtimeOnly 'com.google.android.gms:play-services-location:17.0.0'
    runtimeOnly 'com.google.android.gms:play-services-ads-identifier:17.0.0'
```
4. Import the SDK `import com.reblaze.sdk.reblaze;`
5. Update onCreate method of main application with reblaze initialization:
```java
@Override
    public void onCreate() {
        super.onCreate();
        reblaze.init(this);
    }
```
6. Start the agent
```java
reblaze.start(this,
    "https://demo.reblaze.com",
    "secret",
    "key",
    "user_id",
    shouldShowLogs,
    Interval.MINIMUM_INTERVAL_VALUE.getValue(),
    reportLocation,
    "user_agent"
);
```
  * *this* - Refers to the activity/context, we highly recommend to refer to the main activity
  * *https://demo.reblaze.com* - The application backend service URL
  * *secret* - Secret key that will be used for the encryption
  * *key* - Header name, the header will identify the specific user
  * *user_id* - Header value, the header will identify the specific user
  * *shouldShowLogs* - Value indicating will logs be printed in debug console
  * *Interval.MINIMUM_INTERVAL_VALUE.getValue() - interval in seconds when the events will be sent*
  * *reportLocation* - Value indicating will location be sent
  * *userAgent* - Custom user agent will be send in requests
  
Throws *IllegalArgumentException*:
* If *mainActivity* is null
* If *address* is empty or null
* If *secret* is empty or null
* If *key* is empty or null
* If *uidValue* header is empty or null
* If *intervalInSeconds* is out of range 12..300 seconds

## Signing your application's requests

When application requests are send with the proper signature, Reblaze will mark them as human.
Singing your application requests is done by sending three headers along with your application requests. 

The headers are:
 1. `timestamp` – unix/epoch timestamp of current time (seconds since since Jan 01 1970).
 2. the session key header, e.g. `user_id` as in the above place holder.
 3. `rbzid` – signed value by Reblaze SDK

The value (String) for the `rbzid` header is provided by the static method `getHash`.

```java
reblaze.getHash(unix_timestamp)
```
Trows *IllegalArgumentException*:
* If *secret* is empty or null
* If *uidValue* header is empty or null

Make sure you call `getHash` only **_after_** `reblaze.start` is called.

## Custom Events

Sending custom events will help you monitor events that are unique for your application.

To send a custom event just call the reblaze class and execute the sendEvent function with the name of your custom event
```java
reblaze.sendEvent("CustomEvent")
```

Keep in mind that the reblaze class is static, therefore you can call it from everywhere in the application

## Include location data to events

By default, Reblaze SDK not required location permission and not collect device location information.

To include location information into events need append these permissions to application AndroidManifest.xml

```xml
        <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
        <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
 ```

Also for applications with targetSdkVersion Android 6.0 (API 23) and above should be granted [Runtime Permission](https://developer.android.com/training/permissions/requesting) by application user

Reblaze SDK will automatically check location permission and include location information into events if location data is available.

## Include error listening

To observe error events need to add OnErrorListener:
```java
 reblaze.addOnErrorListener(new OnErrorListener() {
                @Override
                public void onError(Exception e) {

                }
            });
```

## Destory
The SDK works with a thread sending all the events triggered by the application until calling the `Destroy()` function which will end the thread,
we highly recommend calling
```java
reblaze.Destroy()
```
function on hosting app's `onDestroy()` method

## Prevent errors of loading native libraries on some devices

On some devices loading the native library may fail due to bugs like:
```java
java.lang.UnsatisfiedLinkError
```
To counter this Reblaze includes support for the ReLinker tool which will try to extract the native library manually if loading it normally fails.
To set this up add ReLinker to your dependencies:

```groovy
implementation 'com.getkeepsafe.relinker:relinker:1.4.1'
```
Reblaze is calling ReLinker via reflection. If you are using ProGuard or Multidex, make sure to add keep rules so that ReLinker code is not stripped from the final app or is not in the primary dex file.

## Proguard
If you are using ProGuard make sure to add a rule to keep ReLinker classes and methods as reblaze only accesses them via reflection:
-keep class com.getkeepsafe.relinker.** { *; }
