package com.example.reblaze_flutter;

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterActivity;

import static com.reblaze.sdk.Reblaze.reblaze;

public class MainActivity extends FlutterActivity {

    @Override
    public void configureFlutterEngine(@NonNull io.flutter.embedding.engine.FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        reblaze.registerFlutterMethodChannel(flutterEngine);
    };
};
