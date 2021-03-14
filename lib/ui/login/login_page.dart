import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/ui/login/body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
      body: Body()

    );
  }
}

// want to use this as the background...
// decoration: BoxDecoration(
// gradient: LinearGradient(
// begin: Alignment.topRight,
// end: Alignment.bottomLeft,
// colors: [Colors.teal, Colors.cyan],
