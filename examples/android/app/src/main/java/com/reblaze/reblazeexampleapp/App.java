package com.reblaze.reblazeexampleapp;

import android.app.Application;

import com.reblaze.sdk.error.SDKConfigureException;
import com.reblaze.sdk.reblaze;

public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        try {
            reblaze.configure(this, "user_id", "secret");
        } catch (SDKConfigureException e) {
            e.printStackTrace();
        }
    }
}
