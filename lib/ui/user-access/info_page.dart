import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uk_city_planner/services/networking/places_network_service.dart';

class InfoPage extends StatefulWidget {
  final Result place;
  InfoPage({required this.place});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  DetailsResult? _details;

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var restaurantImage = widget.place.photos![0].photoReference;

    if (_details == null) {
      void getDetails() async {
        DetailsResult? details = (await PlacesNetworkService()
            .findDetailsByID(widget.place.placeId!));
        setState(() {
          _details = details;
        });
      }
        getDetails();
      return Padding(
        padding: const EdgeInsets.only(top: 190),
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff5bd5e3),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.35,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: "info tag",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        image: true
                            ? NetworkImage(
                                'https://maps.googleapis.com/maps/api/place/photo?maxwidth=1000&maxheight=1000&photoreference=$restaurantImage&key=AIzaSyDPFVBgZDnp7Ee-6y8K5vPK_8kTOGfYAZ4')
                            : AssetImage("assets/images/noImageAvailable.png")
                                as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.35,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topRight,
                        colors: [
                          const Color(0x45000000),
                          const Color(0x00000000),
                          const Color(0x00000000),
                          const Color(0x8D000000),
                        ],
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Positioned(
                            left: 1.5,
                            top: 3,
                            child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                iconSize: 35.0,
                                color: Colors.black45,
                                onPressed: () => Navigator.pop(context)),
                          ),
                          IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 35.0,
                              color: Colors.white,
                              onPressed: () => Navigator.pop(context)),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20.0,
                  bottom: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: size.width * 0.7,
                        child: Text(
                          widget.place.name.toString(),
                          overflow: TextOverflow.fade,
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              shadows: <Shadow>[
                                Shadow(
                                  color: CupertinoColors.black,
                                  blurRadius: 20,
                                )
                              ]),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[
                              Positioned(
                                left: 1.5,
                                top: 2.5,
                                child: Icon(FontAwesomeIcons.locationArrow,
                                    color: Colors.black45, size: 15.0),
                              ),
                              Icon(FontAwesomeIcons.locationArrow,
                                  color: Color(0xff23adb0), size: 15.0),
                            ],
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: size.width * 0.7,
                            child: Text(
                              widget.place.vicinity.toString(),
                              maxLines: 1,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: CupertinoColors.black,
                                      blurRadius: 20,
                                    )
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 20.0,
                  bottom: 20.0,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  // name
                  width: size.width * 0.9,
                  child: Text(
                    widget.place.name.toString(),
                    maxLines: 1,
                    style: TextStyle(
                        color: Color(0xff494949),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        shadows: <Shadow>[
                          Shadow(
                            color: CupertinoColors.black,
                            blurRadius: 2,
                          )
                        ]),
                  ),
                ),

                SizedBox(height: 2),

                Container(
                  // address
                  width: size.width * 0.9,
                  child: Text(
                    widget.place.vicinity.toString(),
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff494949),
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                    ),
                  ),
                ),

                SizedBox(height: 8),

                Container(
                  // description
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(right: 50, left: 10),
                  child: Flexible(
                    flex: 400,
                    fit: FlexFit.loose,
                    child: Text(
                      "Review:",
                      style: TextStyle(
                        color: Color(0xff23adb0),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.15,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 2),

                Container(
                  // description
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.8,
                  margin: EdgeInsets.only(right: 50, left: 10),
                  child: Flexible(
                    flex: 400,
                    fit: FlexFit.loose,
                    child: Text(
                      ("1: " + _details!.reviews[0].text.toString() + "2: " + _details!.reviews[1].text.toString()),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 8,
                      style: TextStyle(
                        color: Color(0xff494949),
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 15),

                Container(
                  // website
                  width: size.width * 0.9,
                  child: Text(
                    _details!.website.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Color(0xff23adb0),
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                    ),
                  ),
                ),

                SizedBox(
                  height: 6,
                ),

                Container(
                  // phone number
                  width: size.width * 0.9,
                  child: Text(
                    _details!.formattedPhoneNumber.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.5,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0,
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Row(
                  // bottom containers
                  verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // rating
                      alignment: Alignment.topCenter,
                      // color: Colors.red,
                      padding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25,
                              child: Text(
                                'Rating',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                  left: 5, right: 5, top: 1, bottom: 2),
                              width: 100,
                              decoration: BoxDecoration(
                                color: Color(0xff23adb0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: _buildRatingStars(
                                  widget.place.rating!.round()),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // opening hours
                      // color: Colors.green,
                      padding: EdgeInsets.only(left: 13, right: 13),
                      alignment: Alignment.center,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25,
                              child: Text(
                                'Open Now?',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff23adb0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Text(
                                widget.place.openingHours!.openNow
                                    .toString()
                                    .toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // price
                      // color: Colors.blue,
                      padding: EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 25,
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff23adb0),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: Text(
                                '£££ / £££££',
                                style: TextStyle(
                                  color: CupertinoColors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                // ignore: deprecated_member_use
                FlatButton(
                    minWidth: size.width * 0.9,
                    height: 40,
                    color: Color(0xff23adb0),
                    splashColor: Color(0xff23adb0),
                    focusColor: Color(0xff23adb0),
                    child: new Text(
                      "Add to Planner",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      print('Add to Planner button pressed...');
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              ],
            ),
          ],
        ),
      );
    }
  }

  // function made to create rating stars out of ascii
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '★';
    }
    stars.trim();
    return Text(stars, style: TextStyle(fontSize: 20, color: Colors.white));
  }
}
