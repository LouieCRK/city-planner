import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/user-access/info_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uk_city_planner/services/networking/places_network_service.dart';

class ContentCarousel extends StatefulWidget {
  List<Result>? _places;
  List<DetailsResult>? _details;
  String placeName = "";

  ContentCarousel(this._places, this.placeName);
  // this._details // todo - add to constructor when details fixed

  @override
  _ContentCarouselState createState() => _ContentCarouselState();
}

class _ContentCarouselState extends State<ContentCarousel> {
  @override
  Widget build(BuildContext context) {
    if (widget._places == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 190),
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xff5bd5e3),
          ),
        ),
      );
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
                '${widget.placeName} near you',
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
            itemCount: widget._places!.length,
            itemBuilder: (BuildContext context, int index) {
              Result place = widget._places![index];
              // DetailsResult details = widget._details![index]; // todo when details fixed uncomment
              var placePhotos = place.photos!.length;
              var placeImageRef = place.photos![0].photoReference;

              if (placePhotos.toString() == "0"){
                // placeImageRef = details.photos![0].photoReference; // todo - when details fixed uncomment
              } else {
                placeImageRef = place.photos![0].photoReference;
              }

             return GestureDetector(
               onTap: () => Navigator.push(
                 context,
                 MaterialPageRoute(
                   builder: (_) => InfoPage(
                     place: place,
                     // todo - when details fixed - allow access to details data within info_page.dart
                     // details: details,
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
                                          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=200&maxheight=195&photoreference=$placeImageRef&key=AIzaSyDPFVBgZDnp7Ee-6y8K5vPK_8kTOGfYAZ4')
                                      : AssetImage(
                                              "assets/images/noImageAvailable.png")
                                          as ImageProvider,
                                  fit: BoxFit.cover,
                                  // color: Colors.blue,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topRight,
                                  colors: [
                                    const Color(0xFF3F3F3F),
                                    const Color(0x00000000),
                                    const Color(0x00000000),
                                    const Color(0xFF000000),
                                  ],
                                )
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
                                    child: SizedBox(
                                      width: 160,
                                      child: Text(
                                        place.name.toString(),
                                        maxLines: 3,
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
                                            right: 0,
                                            left: 0,
                                            top: 0,
                                            bottom: 0),
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            place.vicinity.toString(),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            style: TextStyle(
                                                color: Colors.white,
                                                shadows: <Shadow>[
                                                  Shadow(
                                                    color:
                                                        CupertinoColors.black,
                                                    blurRadius: 5,
                                                  )
                                                ]),
                                          ),
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
