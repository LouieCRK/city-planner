import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Colors.teal, Colors.cyan],
              ),
            ),
          ),
          elevation: 4,
          actions: [
            IconButton( // home page button
              icon: Icon(Icons.home_rounded),
              onPressed: () => print ("APPBAR - Home button pressed"),
              iconSize: 35,
            ),
            IconButton( // recommended page button
              icon: Icon(Icons.recommend),
              onPressed: () => print ("APPBAR - Recommended button pressed"),
              iconSize: 32,
            ),
            IconButton( // planner page button
                icon: Icon(Icons.library_books_rounded),
                onPressed: () => print ("APPBAR - Planner button pressed"),
                iconSize: 32,
            ),
            IconButton( // map page button
              icon: Icon(Icons.location_on_rounded),
              iconSize: 33,
              onPressed: () => print ("APPBAR - Map button pressed"),
            ),
            IconButton( // settings page button
              icon: Icon(Icons.settings_rounded),
              iconSize: 33,
              onPressed: () => print ("APPBAR - Settings button pressed"),
            ),
          ], // actions
        ),
    );

  }
}