import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/point_of_interest_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  final PointOfInterest pointOfInterest;

  InfoPage({required this.pointOfInterest});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                  tag: widget.pointOfInterest.imageUrl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.pointOfInterest.imageUrl),
                      fit: BoxFit.cover,
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
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.pointOfInterest.name,
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
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Color(0xff23adb0),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.pointOfInterest.city,
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
                  widget.pointOfInterest.name,
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
                  widget.pointOfInterest.address,
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
                    widget.pointOfInterest.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 9,
                    style: TextStyle(
                      color: Color(0xff494949),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                // website
                width: size.width * 0.9,
                child: Text(
                  widget.pointOfInterest.website,
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
                  widget.pointOfInterest.phoneNumber,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
              ),
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
                                widget.pointOfInterest.rating.round()),
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
                              'Opening/Closing',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 3),
                            decoration: BoxDecoration(
                              color: Color(0xff23adb0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Text(
                              widget.pointOfInterest.openingHours[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            decoration: BoxDecoration(
                              color: Color(0xff23adb0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Text(
                              widget.pointOfInterest.openingHours[1],
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
