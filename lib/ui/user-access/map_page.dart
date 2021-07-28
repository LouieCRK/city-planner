import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/services/networking/places_network_service.dart';

import 'info_page.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Geolocator geolocator = Geolocator();
  final placesNetworkService = PlacesNetworkService();
  late BitmapDescriptor customMarker;
  Position? _currentPosition;
  List<Result>? _places;
  Set<Marker>? _markers = Set();

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
      _places = await placesNetworkService.findRestaurants(
          _currentPosition!.latitude.toString(),
          _currentPosition!.longitude.toString());
      setState(() {});
    } catch (ex) {
      print("Could not retrieve places $ex");
    }
  }

  Future _getMarkers(String placeType) async {
    // switch case to check placeType
    switch (placeType) {
      case 'restaurant':
        _places = await placesNetworkService.findRestaurants(
            _currentPosition!.latitude.toString(),
            _currentPosition!.longitude.toString());
        await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(128, 128)),
                'assets/images/map-markers/restaurant-marker.png')
            .then((onValue) {
          customMarker = onValue;
        });
        break;
      case 'nightlife':
        _places = await placesNetworkService.findNightlife(
            _currentPosition!.latitude.toString(),
            _currentPosition!.longitude.toString());
        await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(128, 128)),
                'assets/images/map-markers/nightlife-marker.png')
            .then((onValue) {
          customMarker = onValue;
        });
        break;
      case 'entertainment':
        _places = await placesNetworkService.findEntertainment(
            _currentPosition!.latitude.toString(),
            _currentPosition!.longitude.toString());
        await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(128, 128)),
                'assets/images/map-markers/entertainment-marker.png')
            .then((onValue) {
          customMarker = onValue;
        });
        break;
      case 'sightseeing':
        _places = await placesNetworkService.findSightseeing(
            _currentPosition!.latitude.toString(),
            _currentPosition!.longitude.toString());
        await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(128, 128)),
                'assets/images/map-markers/sightseeing-marker.png')
            .then((onValue) {
          customMarker = onValue;
        });
        break;
      case 'shopping':
        _places = await placesNetworkService.findShopping(
            _currentPosition!.latitude.toString(),
            _currentPosition!.longitude.toString());
        await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(128, 128)),
                'assets/images/map-markers/shopping-marker.png')
            .then((onValue) {
          customMarker = onValue;
        });
        break;
      case 'user':
        await BitmapDescriptor.fromAssetImage(
                ImageConfiguration(size: Size(128, 128)),
                'assets/images/map-markers/user-marker.png')
            .then((onValue) {
          customMarker = onValue;
        });
        _markers!.add(Marker(
          icon: customMarker,
          markerId: MarkerId('user location'),
          position:
              LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
          infoWindow: InfoWindow(
              title: "You are here!"),
        ));
    }

    int i = 0;
    while (i < _places!.length) {
      if (placeType == 'user') {break;} // avoid looping over _places
      Result? places = _places![i];
      _markers!.add(Marker(
        // todo - get customMarker to work
        icon: customMarker,
        markerId: MarkerId(
            '$placeType, $i'), // assign unique marker id to each marker
        position: LatLng(_places![i].geometry!.location!.lat!.toDouble(),
            _places![i].geometry!.location!.lng!.toDouble()),
        infoWindow: InfoWindow(
          title: _places?[i].name,
          snippet: _places?[i].vicinity,
          // on marker tap - navigate to information page
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => InfoPage(
                place: places,
              ),
            ),
          ),
        ),
      ));
      i++;
    }
  }

  void _onMapCreated(GoogleMapController controller) async {
    await _getMarkers('user');
    await _getMarkers("restaurant");
    await _getMarkers("nightlife");
    await _getMarkers("entertainment");
    await _getMarkers("sightseeing");
    await _getMarkers("shopping");
    setState(() {});
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_currentPosition == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff5bd5e3),
          ),
        ),
      );
    }
    if (_markers == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff5bd5e3),
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRect(
                clipBehavior: Clip.hardEdge,
                child: Container(
                    // container for google map
                    height: size.height * 0.926,
                    width: size.width,
                    child: GoogleMap(
                      onMapCreated: _onMapCreated,
                      markers: _markers!,
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_currentPosition!.latitude,
                            _currentPosition!.longitude),
                        zoom: 13.5,
                        tilt: 60,
                      ),
                    )),
              ),
              Container(
                height: size.height * 0.24,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Hero(
                  tag: 'assets/images/map-banner.png',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage('assets/images/map-banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                height: size.height * 0.24,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topRight,
                      colors: [
                        const Color(0x75000000),
                        const Color(0x00000000),
                        const Color(0x00000000),
                        const Color(0x32000000),
                      ],
                    )
                ),
                ),
              Positioned(
                left: 15.0,
                bottom: 20.0,
                width: 250,
                top: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'Hello ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              shadows: <Shadow>[
                                Shadow(
                                  color: CupertinoColors.black,
                                  blurRadius: 15,
                                )
                              ]),
                        ),
                        Text(
                          'User',
                          // widget.pointOfInterest.name,
                          style: TextStyle(
                              color: Color(0xff5bd5e3),
                              fontSize: 22.0,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                              shadows: <Shadow>[
                                Shadow(
                                  color: CupertinoColors.black,
                                  blurRadius: 10,
                                )
                              ]),
                        ),
                        Text(
                          ',',
                          // widget.pointOfInterest.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.2,
                              shadows: <Shadow>[
                                Shadow(
                                  color: CupertinoColors.black,
                                  blurRadius: 10,
                                )
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Check out \npoints of interest \nnear you!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 27.0,
                              shadows: <Shadow>[
                                Shadow(
                                  color: CupertinoColors.black,
                                  blurRadius: 20,
                                )
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5, top: 300),
                height: size.height * 0.4,
                width: 50,
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // restaurant button
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xfffc9003),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        icon: Icon(FontAwesomeIcons.utensils),
                        color: Colors.white,
                        onPressed: () => print('Restaurant filter pressed'),
                      ),
                    ),
                    Container(
                      // nightlife button
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff8c03fc),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        icon: Icon(FontAwesomeIcons.cocktail),
                        color: Colors.white,
                        onPressed: () => print('Nightlife filter pressed'),
                      ),
                    ),
                    Container(
                      // entertainment button
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xffe35bcf),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        alignment: Alignment.centerLeft,
                        icon: Icon(FontAwesomeIcons.dice),
                        color: Colors.white,
                        onPressed: () => print('Entertainment filter pressed'),
                        splashColor: Colors.red,
                      ),
                    ),
                    Container(
                      // sightseeing button
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff61c230),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        alignment: Alignment.centerLeft,
                        icon: Icon(FontAwesomeIcons.eye),
                        color: Colors.white,
                        onPressed: () => print('Sightseeing filter pressed'),
                      ),
                    ),
                    Container(
                      // shopping button
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff5bd5e3),
                      ),
                      child: IconButton(
                        iconSize: 20,
                        icon: Icon(FontAwesomeIcons.shoppingBag),
                        color: Colors.white,
                        onPressed: () => print('Shopping filter pressed'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
