package com.example.reblaze_flutter;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;

import static com.reblaze.sdk.Reblaze.reblaze;

public class MainActivity extends FlutterActivity {

    @Override
    public void configureFlutterEngine(@NonNull io.flutter.embedding.engine.FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new io.flutter.plugin.common.MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), "reblaze.com").setMethodCallHandler(
                (methodCall, result) -> {
                  switch (methodCall.method) {
                    case "generateHash":
                        result.success(reblaze.generateHash());
                        return;
                    case "sendEvent":
                        String eventName = methodCall.arguments();
                        reblaze.sendEvent(eventName);
                        return;
                    case "setBackendUrl":
                        String backendUrl = methodCall.arguments();
                        reblaze.setBackendUrl(backendUrl);
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
                        reblaze.setToken(methodCall.arguments());
                        return;
                    case "setTokenHeaderName":
                        reblaze.setTokenHeaderName(methodCall.arguments());
                        return;
                    case "setTimeslice":
                        reblaze.setTimeslice(methodCall.arguments());
                        return;
                    case "setInterval":
                        Object qq = methodCall.arguments();
                        reblaze.setInterval(methodCall.arguments());
                        return;
                    case "setReportCounters":
                        reblaze.setReportCounters(methodCall.arguments());
                        return;
                    default:
                        result.notImplemented();
                }
            }
        );
    };
};
