import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/user-access/home_page.dart';
import 'package:uk_city_planner/ui/user-access/settings_page.dart';

class NavBar extends StatefulWidget {
  @override
  NavState createState() => NavState();
}

class NavState extends State<NavBar> {
  int selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    // LoginPage(),
    // RegisterPage(),
    HomePage(),
    Text('Recommended'),
    Text('Planner'),
    Text('Map'),
    SettingsPage(),
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
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: CupertinoColors.darkBackgroundGray,
              blurRadius: 20,
              spreadRadius: 3,
            ),
          ],
        ),
        child: BottomNavigationBar(
          unselectedItemColor: Color(0xffe1fcfc),
          selectedItemColor: Colors.white,
          iconSize: 30,
          showUnselectedLabels: false,
          showSelectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem( // home page
              icon: Icon(Icons.home_rounded),
              label: ('Home'),
              backgroundColor: Color(0xff1dbfc2),
            ),
            BottomNavigationBarItem( // recommended page
              icon: Icon(Icons.recommend),
              label: ('Recommended'),
              backgroundColor: Color(0xff1dbfc2),
            ),
            BottomNavigationBarItem( // planner page button
              icon: Icon(Icons.library_books_rounded),
              label: ('Planner'),
              backgroundColor: Color(0xff1dbfc2),
            ),
            BottomNavigationBarItem( // map page button
              icon: Icon(Icons.location_on_rounded),
              label: ('Map/Search'),
              backgroundColor: Color(0xff1dbfc2),
            ),
            BottomNavigationBarItem( // settings page button
              icon: Icon(Icons.settings_rounded),
              label: ('Settings'),
              backgroundColor: Color(0xff1dbfc2),
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTap,
        ),
      ),
    );
  }
}