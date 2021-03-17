import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/ui/registration/login_page.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.teal, Colors.cyan],
            ),
            ),

          child: IconButton(
            icon: Icon(Icons.logout),
              color: Colors.white,
              onPressed: () { // temporary page route to fake logout
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(),
                  ),
                );
              }
          ),
        ),
      ),
    );

  }
}