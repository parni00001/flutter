import 'package:demoflutter/demo/activity/activity_page.dart';
import 'package:demoflutter/demo/login.dart';
import 'package:demoflutter/main.dart';
import 'package:flutter/material.dart';
import '../demo/mine/k_line_chart_page.dart';
import '../splash.dart';

class MyRouter{
   static final Map<String, WidgetBuilder> routes = {
      LoginPage.routerName: (ctx) => LoginPage(),
      SplashPage.routerName: (ctx) => SplashPage(),
      MainPage.routerName: (ctx) => MainPage(),
      ActivityPage.routerName: (ctx) => ActivityPage(),
      KLineChartPage.routerName: (ctx) => KLineChartPage(),
   };

   static final String initialRoute = SplashPage.routerName;
}