import 'package:flutter/material.dart';
import 'common/logger.dart';
import 'package:uk_city_planner/ui/registration/login_page.dart';

void main() {
  runApp(CityPlannerApp());
}

class CityPlannerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Logger.logDebug("Application is in debug mode");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UK City Planner',
      theme: ThemeData(
        primaryColor: Color(0xffe1fcfc),
        accentColor: Color(0xff1dbfc2),
        scaffoldBackgroundColor: Color(0xFFF3F5F7),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),

    );
  }
}
