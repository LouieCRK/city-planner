import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/ui/registration/login_page.dart';

class SettingsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack( // stack used to be able to stack widgets
            alignment: Alignment.center,
            children: <Widget>[

              Positioned( // logo/banner at the top of the screen
                top: size.height * 0.45,
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
                            builder: (context) => LoginPage(),
                          ),
                        );
                      }
                    ),
                ),
              ),
              Positioned(
                top: size.height * 0.52,
                child: Text('Logout Here'),
              ),
            ],
          ),
        ),
    );

  }
}