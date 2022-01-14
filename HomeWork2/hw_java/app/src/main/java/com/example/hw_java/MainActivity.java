package com.example.hw_java;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.icu.text.SimpleDateFormat;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    protected int getRandomColor() {
        Random rnd = new Random();
        return Color.argb(255, rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256));
    }

    @SuppressLint("DefaultLocale")
    protected String getTime() {
        Calendar lessonDate = new GregorianCalendar(2022, Calendar.JANUARY, 14);

        lessonDate.set(Calendar.HOUR, 18);
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

    public void onPressedBtn(View view) {

        ActionBar actionBar;
        actionBar = getSupportActionBar();
        int color = getRandomColor();

        ColorDrawable colorDrawable = new ColorDrawable(color);
        actionBar.setBackgroundDrawable(colorDrawable);

        Button btn1 = (Button) findViewById(R.id.btn1);
        btn1.setText(getTime());
        btn1.setBackgroundColor(color);


    }
}