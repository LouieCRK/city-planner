import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/services/business_logic/places_service.dart';
import 'package:uk_city_planner/widgets/content_carousel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uk_city_planner/widgets/planner_carousel.dart';

class PlannerPage extends StatefulWidget {
  @override
  _PlannerPageState createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  List<Result>? _plannedPlaces = PlacesService().getPlanner();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        transformAlignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.25,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  child: Hero(
                    tag: 'planner-banner',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image(
                        image:
                        AssetImage('assets/images/planner-banner.png'),
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
                            fontSize: 21.5,
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
                            'Lets see what \nyou have planned \ntoday!',
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
                Positioned(
                  right: 20.0,
                  bottom: 24.0,
                  child: Text(
                    getCurrentDate(),
                    // widget.pointOfInterest.name,
                    style: TextStyle(
                        color: Colors.white,
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
                ),
              ],
            ),
            SizedBox(height: 15),
            PlannerCarousel(_plannedPlaces),

          ],
        ),
      ),
    );
  }

  String getCurrentDate() {
    // function to get current date & convert to string
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate.toString();
  }
}
