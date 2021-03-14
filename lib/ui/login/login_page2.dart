import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal, Colors.cyan],
          ),
        ),
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: 0.5,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/login-banner.png',
                  ),
              ),
            ],
        ),
      ),
    );
  }
}