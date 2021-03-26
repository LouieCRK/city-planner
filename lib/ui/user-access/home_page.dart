import 'package:flutter/material.dart';
import 'package:uk_city_planner/widgets/restaurant_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  var _widgetSelector; // todo - use variable to call corresponding widget classes
  List<IconData> _icons = [
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.cocktail,
    FontAwesomeIcons.dice,
    FontAwesomeIcons.eye,
    FontAwesomeIcons.shoppingBag,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        // todo - use better logic
        if (_selectedIndex.isFinite) {
          if (_selectedIndex == 0) {
            print('(0) Restaurant selected...');
            _widgetSelector = RestaurantCarousel();
            RestaurantCarousel();
            return;
          }
          if (_selectedIndex == 1) {
            print('(1) Nightlife selected...');
            // _widgetSelector = NightlifeCarousel();
            return;
          }
          if (_selectedIndex == 2) {
            print('(2) Entertainment selected...');
            return;
          }
          if (_selectedIndex == 3) {
            print('(3) Sightseeing selected...');
            return;
          }
          if (_selectedIndex == 4) {
            print('(4) Shopping selected...');
            return;
          }
        }
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
        ),
        child: Icon(
          _icons[index],
          size: 26.0,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'Lets plan \nyour next trip!',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            // _widgetSelector, // todo - use variable to call corresponding widget classes
            RestaurantCarousel(),
            // NightlifeCarousel(),
            // SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
