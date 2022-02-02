package com.example.classwork202;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.IBinder;

import androidx.core.app.NotificationCompat;

public class MyService extends Service {

    private Handler h;
    private Runnable r;

    int counter = 0;

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private Notification updateNotification() {
        counter++;
        String info = counter + "";

        Context context = getApplicationContext();

        PendingIntent action = PendingIntent.getActivity(context,
                0, new Intent(context, MainActivity.class),
                PendingIntent.FLAG_CANCEL_CURRENT); // Flag indicating that if the described PendingIntent already exists, the current one should be canceled before generating a new one.

        NotificationManager manager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);
        NotificationCompat.Builder builder;

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {

            String CHANNEL_ID = "alex_channel";

            NotificationChannel channel = new NotificationChannel(CHANNEL_ID, "AlexChannel",
                    NotificationManager.IMPORTANCE_HIGH);
            channel.setDescription("Alex channel description");
            manager.createNotificationChannel(channel);

            builder = new NotificationCompat.Builder(this, CHANNEL_ID);
        }
        else
        {
            builder = new NotificationCompat.Builder(context);
        }

        return builder.setContentIntent(action)
                .setContentTitle(info)
                .setTicker(info)
                .setContentText(info)
                .setSmallIcon(R.drawable.ic_launcher_background)
                .setContentIntent(action)
                .setOngoing(true).build();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {

        if (intent.getAction().contains("start")) {
            h = new Handler();
            r = new Runnable() {
                @Override
                public void run() {
                    startForeground(101, updateNotification());
                    h.postDelayed(this, 1000);
                }
            };

            h.post(r);
        } else {
            h.removeCallbacks(r);
            stopForeground(true);
            stopSelf();
        }

        return Service.START_STICKY;
    }
}