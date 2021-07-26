import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/models/point_of_interest_model.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/user-access/info_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestaurantCarousel extends StatefulWidget {
  List<Result>? _restaurants;
  RestaurantCarousel(this._restaurants);

  @override
  _RestaurantCarouselState createState() => _RestaurantCarouselState();
}

class _RestaurantCarouselState extends State<RestaurantCarousel> {
  @override
  Widget build(BuildContext context) {
    if (widget._restaurants == null) {
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
            itemCount: widget._restaurants!.length,
            itemBuilder: (BuildContext context, int index) {
              Result restaurant = widget._restaurants![index];
              PointOfInterest pointOfInterest = pointsOfInterest[1];
              var placesImage = restaurant.photos![0].photoReference;
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
                              child: Expanded(
                                flex: 1,
                                child: Image(
                                  height: 195,
                                  width: 200,
                                  image: true
                                      ? NetworkImage(
                                          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&maxheight=195&photoreference=$placesImage&key=AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo')
                                      : AssetImage(
                                              "assets/images/noImageAvailable.png")
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                  // color: Colors.blue,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 29),
                                    child: Text(
                                      restaurant.name.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                          shadows: <Shadow>[
                                            Shadow(
                                              color: CupertinoColors.black,
                                              blurRadius: 9,
                                            )
                                          ]),
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.locationArrow,
                                        size: 10.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 5.0),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8,
                                            left: 8,
                                            top: 5,
                                            bottom: 2),
                                        child: Text(
                                          restaurant.vicinity.toString(),
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Colors.white,
                                              shadows: <Shadow>[
                                                Shadow(
                                                  color: CupertinoColors.black,
                                                  blurRadius: 5,
                                                )
                                              ]),
                                        ),
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
