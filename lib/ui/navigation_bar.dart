import 'package:flutter/material.dart';
import 'package:uk_city_planner/ui/login_page.dart';
import 'package:uk_city_planner/ui/register_page.dart';
class NavBar extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

class NavState extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    HomePage(),
    RegisterPage(),
    // Text('Home'),
    // Text('Recommended'),
    Text('Planner'),
    Text('Map'),
    Text('Settings'),
  ];

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem( // home page
            icon: Icon(Icons.home_rounded),
            label: ('Home'),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem( // recommended page
            icon: Icon(Icons.recommend),
            label: ('Recommended'),
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem( // planner page button
            icon: Icon(Icons.library_books_rounded),
            label: ('Planner'),
            backgroundColor: Colors.teal,
          ),
          BottomNavigationBarItem( // map page button
            icon: Icon(Icons.location_on_rounded),
            label: ('Map/Search'),
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem( // settings page button
            icon: Icon(Icons.settings_rounded),
            label: ('Settings'),
            backgroundColor: Colors.teal,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTap,
      ),
    );
  }
}