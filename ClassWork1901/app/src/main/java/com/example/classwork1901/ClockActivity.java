package com.example.classwork1901;

import android.annotation.SuppressLint;
import android.os.Handler;
import android.os.Bundle;
import android.util.Log;
import android.view.View;

import androidx.appcompat.app.AppCompatActivity;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class ClockActivity extends AppCompatActivity {

    Handler h = new Handler();
    String INFO = "INFO_";
    boolean isRunning;

    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putBoolean("run", isRunning);
        Log.i(INFO, "onSaveState");
    }

    @Override
    protected void onRestoreInstanceState(Bundle savedState) {
        super.onRestoreInstanceState(savedState);
        isRunning = savedState.getBoolean("run");
        Log.i(INFO, "onRestoreState");
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_clock);
        runTimer();
    }

    public void onStart(View view) {
        isRunning = true;
    }

    public void onStop(View view) {
        isRunning = false;
    }

    @SuppressLint("DefaultLocale")
    protected String getTime() {
        Calendar lessonDate = new GregorianCalendar(2022, Calendar.JANUARY, 19 );

        lessonDate.set(Calendar.HOUR, 21);
        lessonDate.set(Calendar.MINUTE, 0);
        Calendar now = GregorianCalendar.getInstance();

        long diff = lessonDate.getTimeInMillis() - now.getTimeInMillis();

        long day = diff / (24 * 60 * 60 * 1000);
        diff -= day * 24 * 60 * 60 * 1000;

        long hours = diff / (60 * 60 * 1000);
        diff -= (hours * 60 * 60 * 1000);

        long minutes = diff / (60 * 1000);
        diff -= minutes * 60 * 1000;

        long seconds = diff / 1000;

        return day + " дней " + String.format("%02d", hours) + ":" + String.format("%02d", minutes) + ":" + String.format("%02d", seconds);
    }

    public void runTimer() {

        h.post(new Runnable() {
            @Override
            public void run() {
                if (isRunning) {
//                    long date = System.currentTimeMillis();
//                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss.SSS");
//                    String dateString = sdf.format(date);
                    getSupportActionBar().setTitle(getTime());
                }
                h.postDelayed(this, 1);
            }
        });
    }
}
