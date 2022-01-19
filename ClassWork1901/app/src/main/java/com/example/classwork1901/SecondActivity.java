package com.example.classwork1901;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class SecondActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);
    }


    public void onTapBack(View view) {
        Intent intent = new Intent();
        intent.putExtra("smth", "FROM SECOND PAGE");
        setResult(100, intent);
        finish();
    }
}
