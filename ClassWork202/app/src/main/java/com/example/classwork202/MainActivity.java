package com.example.classwork202;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    EditText login, pass;
    SharedPreferences pref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        login = findViewById(R.id.login);
        pass = findViewById(R.id.pass);
    }

    public void handler(View v) {
        if (v.getId() == R.id.save) {
            pref = getPreferences(MODE_PRIVATE);
            SharedPreferences.Editor ed = pref.edit();
            ed.putString("login", login.getText().toString());
            ed.putString("password", pass.getText().toString());
            ed.apply();
        }
        if (v.getId() == R.id.load) {
            pref = getPreferences(MODE_PRIVATE);
            login.setText(pref.getString("login", ""));
            pass.setText(pref.getString("password", ""));
        }
    }
}
