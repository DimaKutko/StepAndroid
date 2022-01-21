package com.example.classwork2101;

import androidx.appcompat.app.AppCompatActivity;

import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.RadioGroup;

public class MainActivity extends AppCompatActivity {

    private int selected;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        RadioGroup radio = (RadioGroup) findViewById(R.id.radioGroupSetectTest);
        selected = radio.getCheckedRadioButtonId();

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
    }


    public void onClickRadioSelectTest(View v) {
        selected = v.getId();

        int color;

        switch (selected) {
            case R.id.yellow:
                color = Color.YELLOW;
                break;
            case R.id.red:
                color = Color.RED;
                break;
            case R.id.green:
                color = Color.GREEN;
                break;
            case R.id.blue:
                color = Color.BLUE;
                break;
            default:
                color = Color.TRANSPARENT;
        }

        View view = this.getWindow().getDecorView();
        view.setBackgroundColor(color);
    }
}