import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  final Result restaurant;
  // todo - uncomment lines below when fixing details
  // final Details details;
  // InfoPage({required this.restaurant, required this.details});
  InfoPage({required this.restaurant});

  @override
  _InfoPageState createState() => _InfoPageState();
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

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var restaurantImage = widget.restaurant.photos![0].photoReference;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.35,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 20.0,
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
                              'https://maps.googleapis.com/maps/api/place/photo?maxwidth=1000&maxheight=1000&photoreference=$restaurantImage&key=AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo')
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
                          gradient : LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              const Color(0xAB000000),
                              const Color(0x00000000),
                              const Color(0x00000000),
                              const Color(0xEE000000),
                            ],
                          )
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 35.0,
                      color: Color(0xff23adb0),
                      onPressed: () => Navigator.pop(context),
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
                          widget.restaurant.name.toString(),
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
                          Icon(
                            FontAwesomeIcons.locationArrow,
                            size: 15.0,
                            color: Color(0xff23adb0),
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: size.width * 0.7,
                            child: Text(
                              widget.restaurant.vicinity.toString(),
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
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                // name
                width: size.width * 0.9,
                child: Text(
                  widget.restaurant.name.toString(),
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
              SizedBox(
                height: 4,
              ),

              Container(
                // address
                width: size.width * 0.9,
                child: Text(
                  widget.restaurant.vicinity.toString(),
                  style: TextStyle(
                    color: Color(0xff494949),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
              SizedBox(height: 10),
              Container(
                // description
                alignment: Alignment.centerLeft,
                width: size.width * 0.8,
                margin: EdgeInsets.only(right: 50, left: 10),
                child: Flexible(
                  flex: 400,
                  fit: FlexFit.loose,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Purus sit amet volutpat consequat. Consectetur a erat nam at lectus urna. Sapien eget mi proin sed libero enim sed faucibus turpis. Dignissim enim sit amet venenatis urna cursus. A condimentum vitae sapien pellentesque habitant morbi tristique senectus et. Vel eros donec ac odio tempor. Mauris cursus mattis molestie a iaculis at erat. Amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et. Quam viverra orci sagittis eu volutpat odio facilisis mauris sit. A erat nam at lectus. Curabitur vitae nunc sed velit. Nibh cras pulvinar mattis nunc se",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),

              // todo - uncomment when details data is accessible
              // Container(
              //   // website
              //   width: size.width * 0.9,
              //   child: Text(
              //     widget.details.website,
              //     overflow: TextOverflow.ellipsis,
              //     maxLines: 1,
              //     style: TextStyle(
              //       color: Color(0xff23adb0),
              //       fontSize: 15.5,
              //       fontWeight: FontWeight.w600,
              //       letterSpacing: 0,
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 6,
              ),

              // todo - uncomment when details data is accessible
              // Container(
              //   // phone number
              //   width: size.width * 0.9,
              //   child: Text(
              //     widget.pointOfInterest.phoneNumber,
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 15.5,
              //       fontWeight: FontWeight.w600,
              //       letterSpacing: 0,
              //     ),
              //   ),
              // ),

              SizedBox(
                height: 6,
              ),
              SizedBox(height: 25),
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
                                widget.restaurant.rating!.round()),
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
                              widget.restaurant.openingHours!.openNow
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
              // todo - (not priority) - add distance from poi in kms
              SizedBox(
                height: 15,
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
