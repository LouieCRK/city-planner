import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/user-access/info_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlannerCarousel extends StatefulWidget {
  List<Result>? _places;

  PlannerCarousel(this._places);

  @override
  _PlannerCarouselState createState() => _PlannerCarouselState();
}

class _PlannerCarouselState extends State<PlannerCarousel> {
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
        Container(
          height: size.height * 0.6579,
          child: GridView.builder(
            padding: EdgeInsets.only(bottom: 15, left: 10, right: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 10),
            scrollDirection: Axis.vertical,
            itemCount: widget._places!.length,
            itemBuilder: (BuildContext context, int index) {
              Result place = widget._places![index];
              var placePhotos = place.photos!.length;
              var placeImageRef = place.photos![0].photoReference;

              if (placePhotos == 0){
                placeImageRef = 'CnRvAAAAwMpdHeWlXl-lH0vp7lez4znKPIWSWvgvZFISdKx45AwJVP1Qp37YOrH7sqHMJ8C-vBDC546decipPHchJhHZL94RcTUfPa1jWzo-rSHaTlbNtjh-N68RkcToUCuY9v2HNpo5mziqkir37WU8FJEqVBIQ4k938TI3e7bf8xq-uwDZcxoUbO_ZJzPxremiQurAYzCTwRhE_V0';
              } else {
                placeImageRef = place.photos![0].photoReference;
              }

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InfoPage(
                      place: place,
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
                          color: Colors.green,
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
                                  height: size.height,
                                  width: size.width,
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
                                        overflow: TextOverflow.fade,
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
