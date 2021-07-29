import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/services/networking/places_network_service.dart';
import 'package:uk_city_planner/widgets/content_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // geolocator for user location
  final Geolocator geolocator = Geolocator();
  final placesNetworkService = PlacesNetworkService();
  late Position _currentPosition;
  List<Result>? _places;
  List<DetailsResult>? _details;
  String _placeName = 'Restaurants';
  int _selectedIndex = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.utensils, // restaurant
    FontAwesomeIcons.cocktail, // nightlife
    FontAwesomeIcons.dice, // entertainment
    FontAwesomeIcons.eye, // sightseeing
    FontAwesomeIcons.shoppingBag, // shopping
  ];

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() async {
        _currentPosition = position;
        await _getPlaces();
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future _getPlaces() async {
    try {
      final placesNetworkService = PlacesNetworkService();
      _places = await placesNetworkService.findRestaurants(
          _currentPosition.latitude.toString(),
          _currentPosition.longitude.toString());
      setState(() {});
    } catch (ex) {
      print("Could not retrieve places $ex");
    }


      // int i = 0;
      // while (i < _places!.length) {
      //   // loop over _places.length
      //   String placeID = _places![i].placeId.toString();
      //   try {
      //     DetailsResult details = (await placesNetworkService
      //         .findDetailsByID(placeID));
      //     _details!.add(details);
      //     return _details!;
      //   } catch (ex) {
      //     print("Could not retrieve details $ex");
      //   }
      //   setState(() {});
      //   i++;
      // }
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () async {
        _places = null;
        setState(() {
          _selectedIndex = index;
        });

        if (_selectedIndex.isFinite) {
          if (_selectedIndex == 0) {
            _placeName = "Restaurants";
            _places = await placesNetworkService.findRestaurants(
                _currentPosition.latitude.toString(),
                _currentPosition.longitude.toString());
            setState(() {});
            return;
          }
          if (_selectedIndex == 1) {
            _placeName = "Nightlife";
            _places = await placesNetworkService.findNightlife(
                _currentPosition.latitude.toString(),
                _currentPosition.longitude.toString());
            setState(() {});
            return;
          }
          if (_selectedIndex == 2) {
            _placeName = "Entertainment";
            _places = await placesNetworkService.findEntertainment(
                _currentPosition.latitude.toString(),
                _currentPosition.longitude.toString());
            setState(() {});
            return;
          }
          if (_selectedIndex == 3) {
            _placeName = "Sightseeing";
            _places = await placesNetworkService.findSightseeing(
                _currentPosition.latitude.toString(),
                _currentPosition.longitude.toString());
            setState(() {});
            return;
          }
          if (_selectedIndex == 4) {
            _placeName = "Shopping";
            _places = await placesNetworkService.findShopping(
                _currentPosition.latitude.toString(),
                _currentPosition.longitude.toString());
            setState(() {});
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
            Container(
              child: SizedBox(
                height: 20.0,
              ),
            ),
            ContentCarousel(_places, _placeName),
            // _details // todo add to ContentCarousel when fixed
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
