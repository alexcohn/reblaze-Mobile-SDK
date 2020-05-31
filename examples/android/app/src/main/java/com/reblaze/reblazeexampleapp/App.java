package com.reblaze.reblazeexampleapp;

import android.app.Application;

import com.reblaze.sdk.reblaze;

public class App extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        reblaze.init(this.getApplicationContext());
    }
}
