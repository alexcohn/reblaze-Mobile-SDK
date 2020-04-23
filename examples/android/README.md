# Reblaze SDK (Android)

The Reblaze SDK for Android is an extension for any mobile application that monitors all native events or custom events provided by you,
all events are being sent to Reblaze every 12 seconds and can be discovered in Reblaze Console by filtering `url:/8d47`.

## Installation
To use the source code in your project, add the SDK to the application dependencies, import the SDK, and initiate the agent with your configurations.

1. Open your project in *Android Studio*
2. Add the dependency to the project `file > new > import library` and select the SDK library
3. Import the SDK `import com.reblaze.sdk.reblaze;`
4. Start the agent
```java
reblaze.start(this, "https://demo.reblaze.com", "xxxxxxxxxxxxx", "user_id","john@smith.name");
```
  * *this* - Refers to the activity/context, we highly recommend to refer to the main activity
  * *https://demo.reblaze.com* - The application backend service URL
  * *xxxxxxxxxxxxx* - Secret key that will be used for the encryption
  * *foo* - Header name, the header will identive the specific user
  * *bar* - Header value, the header will identive the specific user

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
        <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
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
