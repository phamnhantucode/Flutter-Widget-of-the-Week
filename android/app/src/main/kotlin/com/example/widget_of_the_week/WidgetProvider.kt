package com.example.widget_of_the_week

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class HomeScreenWidgetProvider: HomeWidgetProvider() {
    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {
                //open app when the widget was clicked
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(context, MainActivity::class.java)
                setOnClickPendingIntent(R.id.widget_root, pendingIntent)

                val counter = widgetData.getInt("_counter", 0)
                var counterText = "Your counter value is: $counter"

                if (counter == 0) {
                    counterText = "You have not pressed the counter button"
                }

                setTextViewText(R.id.tv_counter, counterText)

                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(context, Uri.parse("myAppWidget://updateCounter"))
                setOnClickPendingIntent(R.id.bt_update, backgroundIntent)

            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}
