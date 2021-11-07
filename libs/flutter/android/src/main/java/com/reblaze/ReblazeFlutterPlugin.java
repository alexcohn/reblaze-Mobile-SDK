package com.reblaze;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import static com.reblaze.sdk.Reblaze.reblaze;

import android.util.Log;

import java.util.List;

/** ReblazePlugin */
public class ReblazeFlutterPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "reblaze.com");
    channel.setMethodCallHandler(this);
    if (BuildConfig.DEBUG)
    reblaze.setEventListener((kind, s) -> {
      Log.println(kind.getValue(), "flutter", s);
    });
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    switch (call.method) {
      case "generateHash":
        result.success(reblaze.generateHash());
        return;
      case "sendEvent":
        String eventName = (String) call.arguments();
        if (eventName != null) {
          reblaze.sendEvent(eventName);
        }
        return;
      case "setBackendUrl":
        String backendUrl = (String) call.arguments();
        if (backendUrl != null) {
          reblaze.setBackendUrl(backendUrl);
        }
        return;
      case "getBackendUrl":
        result.success(reblaze.getBackendUrl());
        return;
      case "getUserAgent":
        result.success(reblaze.getUserAgent());
        return;
      case "getConfigurationName":
        result.success(reblaze.getConfigurationName());
        return;
      case "getHashVariant":
        result.success(reblaze.getHashVariant());
        return;
      case "getToken":
        result.success(reblaze.getToken());
        return;
      case "getTokenHeaderName":
        result.success(reblaze.getTokenHeaderName());
        return;
      case "getTimeslice":
        result.success(reblaze.getTimeslice());
        return;
      case "getInterval":
        result.success(reblaze.getInterval());
        return;
      case "getReportCounters":
        result.success(reblaze.getReportCounters());
        return;
      case "setToken":
        String token = (String) call.arguments();
        if (token != null) {
          reblaze.setToken(token);
        }
        return;
      case "setTokenHeaderName":
        String tokenHeaderName = (String) call.arguments();
        if (tokenHeaderName != null) {
          reblaze.setTokenHeaderName(tokenHeaderName);
        }
        return;
      case "setTimeslice":
        Integer timeslice = (Integer) call.arguments();
        if (timeslice != null) {
          reblaze.setTimeslice(timeslice);
        }
        return;
      case "setInterval":
        Integer interval = (Integer) call.arguments();
        if (interval != null) {
          reblaze.setInterval(interval);
        }
        return;
      case "setReportCounters":
        String reportCounters = (String) call.arguments();
        if (reportCounters != null) {
          reblaze.setReportCounters(reportCounters.equals(com.reblaze.sdk.ReportCounters.ALL.name()) ? com.reblaze.sdk.ReportCounters.ALL : com.reblaze.sdk.ReportCounters.NONE);
        }
        return;
      case "enableMock":
        reblaze.enableMock();
        return;
      case "setMockResponse":
        List<Object> args = (List<Object>) call.arguments();
        if (args != null && args.size() == 3) {
          Integer code = (Integer) args.get(0);
          String remoteConfig = (String) args.get(1);
          Integer delay = (Integer) args.get(2);
          if (delay == -1) {
            reblaze.setMockResponse(code, remoteConfig);
          }
          else {
            reblaze.setMockResponse(code, remoteConfig, delay);
          }
        }
        else {
          result.notImplemented();
        }
        return;
      default:
        result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    reblaze.setEventListener(null);
    channel.setMethodCallHandler(null);
  }

}
