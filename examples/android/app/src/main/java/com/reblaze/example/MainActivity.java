package com.reblaze.example;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.TextView;

import static com.reblaze.sdk.Reblaze.reblaze;


public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void sendCustomEvent(View $) {
        Log.d("MainActivity", "ButtonClick");
        // Send reblaze custom developer needed event
        reblaze.sendEvent("ButtonClick");
    }

    public void sendMockString(View $) {
        Log.d("MainActivity", "SendMock");
        reblaze.setMockResponse(200, ((TextView)findViewById(R.id.mock_string)).getText().toString());
    }
}
