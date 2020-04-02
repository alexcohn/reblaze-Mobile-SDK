package com.reblaze.reblazeexampleapp;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;

import com.reblaze.sdk.Interval;
import com.reblaze.sdk.reblaze;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        Button myButton = (Button)findViewById(R.id.button);
        myButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.d("MainActivity", "ButtonClick");
                // Send reblaze custom developer needed event
                reblaze.sendEvent("ButtonClick");
            }
        });

        // Start the SDK session for this app
        reblaze.start(this, "https://mobilesdkqa.prod2.reblaze.com", "08679d101bb5d41sdj4321b15asdfe4", "UserName","test@123.io", Interval.MINIMUM_INTERVAL_VALUE.getValue());
    }

    @Override
    public void onDestroy() {
        // End SDK Session.
        reblaze.Destroy();
        super.onDestroy();
    }
}
