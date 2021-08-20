import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/services/business_logic/places_service.dart';
import 'package:uk_city_planner/widgets/content_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // geolocator for user location
  final Geolocator geolocator = Geolocator(); // geolocator to get user coordinates
  List<Result>? _places; // list of 'result' which is our place_model.dart class to parse json results
  List<DetailsResult>? _details; // list of 'detailsResult' which is our place_details_model.dart class to parse json results
  String _placeType = 'Restaurants'; // placeholder for _placeType (restaurants is first to render)
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
    _getCurrentLocation(); // call getLocation on screen initialisation
    super.initState();
  }

  _getCurrentLocation() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() async {
        //
        PlacesService().setCurrentLocation(position.latitude, position.longitude);
        await _getPlaces();
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future _getPlaces() async {
    try {
      _places = await PlacesService().getPlace(TypeOfPlace.restaurants);
      setState(() {});
    } catch (ex) {
      print("Could not retrieve places $ex");
    }
  }

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () async {
        _places = null;
        setState(() {
          _selectedIndex = index;
        });

        switch(_selectedIndex) {
          case 0:
            _placeType = "Restaurants";
            _places = await PlacesService().getPlace(TypeOfPlace.restaurants);
            break;
          case 1:
            _placeType = "Nightlife";
            _places = await PlacesService().getPlace(TypeOfPlace.nightlife);
            break;
          case 2:
            _placeType = "Entertainment";
            _places = await PlacesService().getPlace(TypeOfPlace.entertainment);
            break;
          case 3:
            _placeType = "Sightseeing";
            _places = await PlacesService().getPlace(TypeOfPlace.sightseeing);
            break;
          case 4:
            _placeType = "Shopping";
            _places = await PlacesService().getPlace(TypeOfPlace.shopping);
            break;
          default:
            throw 'Tab index does not exist.';
        }
        setState(() { });
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
            ContentCarousel(_places, _placeType),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
