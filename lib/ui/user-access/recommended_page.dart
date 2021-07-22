import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/widgets/horizontal/entertainment_horizontal.dart';
import 'package:uk_city_planner/widgets/horizontal/nightlife_horizontal.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/widgets/horizontal/restaurant_horizontal.dart';

class RecommendedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    height: size.height * 0.25,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Hero(
                      tag: 'planner-banner',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image(
                          image: AssetImage('assets/images/recommended-banner.png'),
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
                              "Lets see what \nis recommended \nfor you!",
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
                ],
              ),
              SizedBox(
                height: 15,
                child: Container(
                  // color: Color(0xff1dbfc2),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                  child: RestaurantHorizontal()
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: NightlifeHorizontal()
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: EntertainmentHorizontal()
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
      );
  }
}
