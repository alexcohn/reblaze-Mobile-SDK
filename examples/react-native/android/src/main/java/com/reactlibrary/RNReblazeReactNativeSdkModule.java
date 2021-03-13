
package com.reactlibrary;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import static com.reblaze.sdk.Reblaze.reblaze;

public class RNReblazeReactNativeSdkModule extends ReactContextBaseJavaModule {

  private final ReactApplicationContext reactContext;

  public RNReblazeReactNativeSdkModule(ReactApplicationContext reactContext) {
    super(reactContext);
    this.reactContext = reactContext;
  }

  @ReactMethod
  public void start(String url, String secret, String headerName, String headerValue) {
    reblaze.setUidHeaderName(headerName);
    reblaze.setUid(headerValue);
    reblaze.setBackendUrl(url);
  }

  @ReactMethod
  public void sendEvent(String eventName) {
    reblaze.sendEvent(eventName);
  }

  @ReactMethod
  public void Destroy() {
  }

  @Override
  public String getName() {
    return "RNReblazeReactNativeSdk";
  }
}