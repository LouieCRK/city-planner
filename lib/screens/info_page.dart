import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/point_of_interest_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatefulWidget {
  // final Destination destination;
  final PointOfInterest pointOfInterest;

  // InfoPage({this.destination});
  InfoPage({this.pointOfInterest});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // function made to create rating stars out of ascii
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.42,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
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
                            Shadow(color: CupertinoColors.black, blurRadius: 20,)
                          ]
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 15.0,
                          color: Colors.white70,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          widget.pointOfInterest.city,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                              shadows: <Shadow>[
                                Shadow(color: CupertinoColors.black, blurRadius: 20,)
                              ]
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
            width: 10, height: 10,
          ),

          Container( // name
            width: size.width * 0.9,
            child: Text(
              widget.pointOfInterest.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
          ),
          SizedBox(height: 2,),

          Container( // address
            width: size.width * 0.9,
            child: Text(
              widget.pointOfInterest.address,
              style: TextStyle(
                color: CupertinoColors.darkBackgroundGray,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Container( // description
            alignment: Alignment.centerLeft,
            width: size.width * 0.8,
            margin: EdgeInsets.only(right: 50, left: 10),
            child: Text(
              widget.pointOfInterest.description,
              style: TextStyle(
                color: Color(0xff696969),
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.1,
                ),
              ),
            ),
          SizedBox(height: 10,),

          Container( // website
            width: size.width * 0.9,
            child: Text(
              widget.pointOfInterest.website,
              style: TextStyle(
                color: Color(0xff1dbfc2),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(height: 6,),

          Container( // phone number
            width: size.width * 0.9,
            child: Text(
              widget.pointOfInterest.phoneNumber,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(height: 6,),

          Container( // email
            width: size.width * 0.9,
            child: Text(
              widget.pointOfInterest.email,
              style: TextStyle(
                color: Color(0xff1dbfc2),
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
          ),
          SizedBox(height: 10,),

          Row( // bottom containers
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( // rating
                alignment: Alignment.centerLeft,
                color: Colors.red,
                padding: EdgeInsets.all(10),
                width: size.width * 0.35,
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          'Rating',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                            child: _buildRatingStars(widget.pointOfInterest.rating),
                        ),
                      ],
                    ),
                  ),
              ),
              Container( // price
                color: Colors.lightGreen,
                padding: EdgeInsets.all(5),
                width: size.width * 0.2,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Text(
                          '££',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container( // opening hours
                color: Colors.purple,
                padding: EdgeInsets.all(5),
                width: size.width * 0.3,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        'Opening',
                        style: TextStyle(
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Text(
                          widget.pointOfInterest.openingHours[0],
                        ),
                      ),
                      Text(
                        'Closing',
                        style: TextStyle(
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                        child: Text(
                          widget.pointOfInterest.openingHours[1],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ],
        ),
    );
  }
}
