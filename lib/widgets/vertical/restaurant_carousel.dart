import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/models/point_of_interest_model.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/user-access/info_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantCarousel extends StatefulWidget {
  List<Result>? _restauarants;
  RestaurantCarousel(this._restauarants);

  @override
  _RestaurantCarouselState createState() => _RestaurantCarouselState();
}

class _RestaurantCarouselState extends State<RestaurantCarousel> {
  @override
  Widget build(BuildContext context) {
    if (widget._restauarants == null) {
      return Container();
    }

    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Restaurants near you',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              GestureDetector(
                onTap: () => print('See All'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Container(
          // list view build for restaurants near user location
          height: size.height * 0.59,
          // height: 250,
          child: GridView.builder(
            padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 10),
            scrollDirection: Axis.vertical,
            itemCount: pointsOfInterest.length,
            itemBuilder: (BuildContext context, int index) {
              PointOfInterest pointOfInterest = pointsOfInterest[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InfoPage(
                      pointOfInterest: pointOfInterest,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 5,
                    top: 5,
                    left: 5,
                    right: 5,
                  ),
                  // color: Colors.red,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 5.0),
                              blurRadius: 8.0,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 195,
                                width: 200,
                                image: AssetImage(pointOfInterest.imageUrl),
                                fit: BoxFit.cover,
                                // color: Colors.blue,
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    pointOfInterest.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24.0,
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
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Text(
                                        pointOfInterest.city,
                                        style: TextStyle(
                                            color: Colors.white,
                                            shadows: <Shadow>[
                                              Shadow(
                                                color: CupertinoColors.black,
                                                blurRadius: 5,
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
