package com.example.widget;
import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.widget.RemoteViews;
import android.widget.Toast;
import android.net.Uri;

public class FirstWidget extends AppWidgetProvider {

    @Override
    public void onUpdate(Context context, AppWidgetManager wm, int[] appWidgetIds) {
        for (int currentWidgetId : appWidgetIds) {
            String url = "http://t.me/trance_mus";

            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            intent.setData(Uri.parse(url));

            PendingIntent pending = PendingIntent.getActivity(context, 0, intent, 0);
            RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.first_widget);
            views.setOnClickPendingIntent(R.id.bt1, pending);
            wm.updateAppWidget(currentWidgetId, views);
            Toast.makeText(context, "Виджет добавлен!", Toast.LENGTH_SHORT).show();
        }
    }
}