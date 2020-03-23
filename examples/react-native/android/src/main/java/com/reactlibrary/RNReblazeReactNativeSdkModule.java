
package com.reactlibrary;

import android.app.Activity;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Callback;
import com.reblaze.sdk.reblaze;

public class RNReblazeReactNativeSdkModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNReblazeReactNativeSdkModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @ReactMethod
  public void start(String url, String secret, String headerName, String headerValue) {
    Activity activity = getCurrentActivity();
    reblaze.start(activity, url, secret, headerName, headerValue);
  }

  @ReactMethod
  public void sendEvent(String eventName) {
    reblaze.sendEvent(eventName);
  }

  @ReactMethod
  public void Destroy() {
    reblaze.Destroy();
  }

  @Override
  public String getName() {
    return "RNReblazeReactNativeSdk";
  }
}