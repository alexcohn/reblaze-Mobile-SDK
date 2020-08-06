package com.reblaze.reblazeexampleapp;

import android.Manifest;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.RadioButton;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AppCompatActivity;

import com.reblaze.sdk.Interval;
import com.reblaze.sdk.error.OnErrorListener;
import com.reblaze.sdk.error.SDKConfigurationException;
import com.reblaze.sdk.reblaze;


public class MainActivity extends AppCompatActivity {
    private static Integer PERMISSION_REQUEST_CODE = 981;

    private RadioButton locationButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        Button myButton = findViewById(R.id.button);
        myButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d("MainActivity", "ButtonClick");
                // Send reblaze custom developer needed event
                reblaze.sendEvent("ButtonClick");
            }
        });

        locationButton = findViewById(R.id.rb_location);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            locationButton.setVisibility(View.VISIBLE);
            checkLocationPermission();
        }
        locationButton.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean isLocationTrackingEnable) {
                if (isLocationTrackingEnable) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                        requestLocationPermission();
                    }
                }
            }
        });
    }

    @Override
    protected void onStart() {
        super.onStart();
        // Start the SDK session for this app
        reblaze.addOnErrorListener(new OnErrorListener() {
            @Override
            public void onError(Exception e) {
                Log.d("MainActivity", "Error: " + e.getMessage());
            }
        });
        try {
            reblaze.start(this,
                    "server_url",
                    "user_name",
                    true,
                    Interval.MINIMUM_INTERVAL_VALUE.getValue(),
                    true,
                    "user_agent");
        } catch (SDKConfigurationException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onStop() {
        super.onStop();
        // End SDK Session.
        reblaze.stop();
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void requestLocationPermission() {
        requestPermissions(new String[]{Manifest.permission.ACCESS_COARSE_LOCATION}, PERMISSION_REQUEST_CODE);
    }

    @RequiresApi(api = Build.VERSION_CODES.M)
    private void checkLocationPermission() {
        boolean fineLocationPermissionGranted = checkSelfPermission(Manifest.permission.ACCESS_COARSE_LOCATION) == PackageManager.PERMISSION_GRANTED;
        locationButton.setChecked(fineLocationPermissionGranted);
    }

    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == PERMISSION_REQUEST_CODE) {
            boolean locationPermissionGranted = (grantResults.length > 0
                    && grantResults[0] == PackageManager.PERMISSION_GRANTED);
            locationButton.setChecked(locationPermissionGranted);
        }
    }
}
