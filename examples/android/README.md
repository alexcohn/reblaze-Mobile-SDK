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
    implementation 'com.reblaze.sdk:mobile-sdk:1.8.0'
```
3. Implement runtime dependencies in module build.gradle:
```groovy
    runtimeOnly 'com.google.android.gms:play-services-location:17.0.0'
    runtimeOnly 'com.google.android.gms:play-services-ads-identifier:17.0.0'
```
4. Import the SDK `import com.reblaze.sdk.reblaze;`

## Start the agent

1. Update `onCreate()` method of application class with initialization method `configure()`:
```java
 @Override
    public void onCreate() {
        super.onCreate();
        try {
            reblaze.configure(this, "user_id", "secret");
        } catch (SDKConfigureException e) {
            e.printStackTrace();
        }
    }
```
  * *this* - Refers to the context
  * *user_id* - Header value, the header will identify the specific user
  * *secret* - Secret key that will be used for the encryption
  
  Please replace placeholder values with your own credentials.
  
  Throws *IllegalArgumentException*:
  * If *secret* is empty or null
  * If *user_id* is empty or null
  
  Throws *SDKConfigureException*:
  * If SDK was previously configured without calling after *stop()* method 
  
2. Start SDK, we recommend to start SDK on hosting activity's `onStart()` method

```java
reblaze.start(this,
    "server_url",
    "secret",
    "key",
    "user_id",
    shouldShowLogs,
    Interval.MINIMUM_INTERVAL_VALUE.getValue(),
    reportLocation,
    "user_agent"
);
```
   Or you can start without user agent, there will be used default value:
```java
reblaze.start(this,
       "server_url",
       "secret",
       "key",
       "user_id",
       shouldShowLogs,
       Interval.MINIMUM_INTERVAL_VALUE.getValue(),
       reportLocation
 );
```

  * *this* - Refers to the activity/context, we highly recommend to refer to the main activity
  * *server_url* - The application backend service URL
  * *secret* - Secret key that will be used for the encryption
  * *key* - Header name, the header will identify the specific user
  * *user_id* - Header value, the header will identify the specific user
  * *shouldShowLogs* - Value indicating will logs be printed in debug console
  * *Interval.MINIMUM_INTERVAL_VALUE.getValue()* - interval in seconds when the events will be sent
  * *reportLocation* - Value indicating will location be sent
  * *user_agent* - Custom user agent will be send in requests
  
   Please replace placeholder values with your own credentials.
   
Throws *IllegalArgumentException*:
* If *mainActivity* is null
* If *address* is empty or null
* If *secret* is empty or null
* If *key* is empty or null
* If *uidValue* header is empty or null
* If *intervalInSeconds* is out of range 12..300 seconds
* If *user_agent* is empty or null

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
Throws *SDKConfigureException*:
* If *start()* or *configure()* method was not called previously
Make sure you call `getHash()` only **_after_** `reblaze.start()` or `reblaze.configure()` is called.

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

To observe error events need to add OnErrorListener, we recommend to add Error listener on hosting activity's `onStart()` method:
```java
 reblaze.addOnErrorListener(new OnErrorListener() {
                @Override
                public void onError(Exception e) {

                }
            });
```

## Stop
The SDK works with a thread sending all the events triggered by the application until calling the `stop()` function which will end the thread,
we highly recommend calling
```java
reblaze.stop()
```
function on hosting app's `onStop()` method

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