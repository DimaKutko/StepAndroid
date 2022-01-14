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
        Calendar lessonDate = new GregorianCalendar(2022, 0, 14, 18, 0);
        Calendar now = GregorianCalendar.getInstance();

        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(lessonDate.getTimeInMillis() - now.getTimeInMillis());

//        System.out.println(lessonDate.getTime());

        int h = c.get(Calendar.HOUR_OF_DAY) - 1;
        int d = c.get(Calendar.DAY_OF_MONTH) - 1;
        int m = c.get(Calendar.MINUTE);
        int s = c.get(Calendar.SECOND);

        return d + " дней " + String.format("%02d", h) + ":" + String.format("%02d", m) + ":" + String.format("%02d", s);
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