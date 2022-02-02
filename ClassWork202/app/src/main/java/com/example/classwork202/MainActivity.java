package com.example.classwork202;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void start(View v) {
        if (isMyServiceRunning(MyService.class)) return;
        Intent startIntent = new Intent(this, MyService.class);
        startIntent.setAction("start");
        startService(startIntent);
    }

    public void stop(View v) {
        if (!isMyServiceRunning(MyService.class)) return;
        Intent stopIntent = new Intent(this, MyService.class);
        stopIntent.setAction("stop");
        startService(stopIntent);
    }

    // проверка, запущен ли сервис
    private boolean isMyServiceRunning(Class<?> serviceClass) {
        ActivityManager manager = (ActivityManager) getSystemService(Context.ACTIVITY_SERVICE);
        for (ActivityManager.RunningServiceInfo service : manager.getRunningServices(Integer.MAX_VALUE)) {
            if (serviceClass.getName().equals(service.service.getClassName())) {
                return true;
            }
        }
        return false;
    }
}