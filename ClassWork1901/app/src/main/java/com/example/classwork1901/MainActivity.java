package com.example.classwork1901;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onTap(View view) {
        Intent intent = new Intent(this, SecondActivity.class);
        startActivityForResult(intent, 100);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        String str = data.getStringExtra("smth");

        TextView tv = findViewById(R.id.textView1);
        tv.setText(str);
    }

    public void onClickSend(View view) {
        Intent intent = new Intent(Intent.ACTION_SEND);

        intent.setType("text/plain");
        intent.putExtra(Intent.EXTRA_SUBJECT, "TEMA");
        intent.putExtra(Intent.EXTRA_TEXT, "Kut'ko Dima");
        this.startActivity(intent);
    }

    public void onClickClock(View view) {
        Intent intent = new Intent(MainActivity.this, ClockActivity.class);
        startActivity(intent);

    }
}