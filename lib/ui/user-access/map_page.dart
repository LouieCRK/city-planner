import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uk_city_planner/models/point_of_interest_model.dart';
import 'package:http/http.dart' as http;

class MapPage extends StatefulWidget {
  final PointOfInterest pointOfInterest;
  MapPage({this.pointOfInterest});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  // todo - work out why _getCurrentLocation returns an error, on second call it works???
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        if (place.locality == ""){
          _currentAddress = "${place.postalCode}, ${place.country}";
        }else{
          _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
        }
      });
    } catch (e) {
      print(e);
    }
  }

  // un comment to use custom marker images
  // @override
  // void initState() {
  //   super.initState();
  //   setCustomMarker();
  // }
  //
  // void setCustomMarker() async{
  //   mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/map-markers/entertainment-marker.png',);
  // }

  void _OnMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
           // icon: mapMarker, // un comment to use custom marker images
          infoWindow: InfoWindow(
            title: _currentAddress,
            snippet: 'Snippet...',
          ),
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                  // container for google map
                  height: size.height * 0.926,
                  width: size.width,
                  child: GoogleMap(
                    onMapCreated: _OnMapCreated,
                    markers: _markers,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(_currentPosition.latitude, _currentPosition.longitude),
                      zoom: 16,
                    ),
                  )),
              Container(
                height: size.height * 0.3,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
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
                    Container( // restaurant button
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xfffc9003),
                      ),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.utensils),
                        color: Colors.white,
                        onPressed: () => print('Restaurant filter pressed'),
                      ),
                    ),
                    Container( // nightlife button
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff8c03fc),
                      ),
                      child: IconButton(
                        icon: Icon(FontAwesomeIcons.cocktail),
                        color: Colors.white,
                        onPressed: () => print('Nightlife filter pressed'),
                      ),
                    ),
                    Container( // entertainment button
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xffe35bcf),
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(FontAwesomeIcons.dice),
                        color: Colors.white,
                        onPressed: () =>
                            print('Entertainment filter pressed'),
                            splashColor: Colors.red,
                      ),
                    ),
                    Container( // sightseeing button
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff61c230),
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        icon: Icon(FontAwesomeIcons.eye),
                        color: Colors.white,
                        onPressed: () => print('Sightseeing filter pressed'),
                      ),
                    ),
                    Container( // shopping button
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 5.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xff5bd5e3),
                      ),
                      child: IconButton(
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
