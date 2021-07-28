import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/services/networking/places_network_service.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Geolocator geolocator = Geolocator();
  final placesNetworkService = PlacesNetworkService();
  late Position _currentPosition;
  late BitmapDescriptor mapMarker;
  List<Result>? _places;
  Set<Marker> _markers = Set();

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
  }

  // todo - work out how to use custom markers for each type of place
  // void setCustomMarker() async{
  //   mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/map-markers/entertainment-marker.png',);
  // }

  void _OnMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position:
              LatLng(_currentPosition.latitude, _currentPosition.longitude),
          // icon: mapMarker,
          infoWindow: InfoWindow(
            title: "Title...",
            snippet: 'Snippet...',
          ),
        ),
      );
    });
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
                      onMapCreated: _OnMapCreated,
                      markers: _markers,
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(_currentPosition.latitude,
                            _currentPosition.longitude),
                        zoom: 14.5,
                        tilt: 40,
                      ),
                    )),
              ),
              Container(
                height: size.height * 0.235,
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
                  tag: 'planner-banner',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage('assets/images/map-banner.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                    Text(
                      'Hello User,',
                      // widget.pointOfInterest.name,
                      style: TextStyle(
                          color: Color(0xff23adb0),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          shadows: <Shadow>[
                            Shadow(
                              color: CupertinoColors.black,
                              blurRadius: 10,
                            )
                          ]),
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
                margin: const EdgeInsets.only(left: 13, top: 300),
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
