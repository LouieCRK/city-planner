// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:uk_city_planner/models/point_of_interest_model.dart';
// import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/user-access/info_page.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class EntertainmentHorizontal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 20.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 'Entertainment for you',
//                 style: TextStyle(
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 5),
//         Container(
//           // list view build for restaurants near user location
//           height: size.height * 0.2,
//           child: GridView.builder(
//             padding: EdgeInsets.zero,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 1, crossAxisSpacing: 0, mainAxisSpacing: 0),
//             scrollDirection: Axis.horizontal,
//             itemCount: pointsOfInterest.length,
//             itemBuilder: (BuildContext context, int index) {
//               PointOfInterest pointOfInterest = pointsOfInterest[index];
//               return GestureDetector(
//                 onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => InfoPage(
//                       pointOfInterest: pointOfInterest,
//                     ),
//                   ),
//                 ),
//                 child: Container(
//                   margin: EdgeInsets.only(
//                     bottom: 5,
//                     top: 5,
//                     left: 10,
//                     right: 5,
//                   ),
//                   // color: Colors.red,
//
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: <Widget>[
//                       Container(
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(20.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black26,
//                               offset: Offset(0.0, 5.0),
//                               blurRadius: 8.0,
//                             ),
//                           ],
//                         ),
//                         child: Stack(
//                           children: <Widget>[
//                             ClipRRect(
//                               borderRadius: BorderRadius.circular(20.0),
//                               child: Image(
//                                 height: 200,
//                                 width: 200,
//                                 image: AssetImage(pointOfInterest.imageUrl),
//                                 fit: BoxFit.cover,
//                                 // color: Colors.blue,
//                               ),
//                             ),
//                             Positioned(
//                               left: 6.0,
//                               bottom: 10.0,
//                               width: 150,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Text(
//                                     pointOfInterest.name,
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 22.0,
//                                         fontWeight: FontWeight.w600,
//                                         letterSpacing: 1.1,
//                                         shadows: <Shadow>[
//                                           Shadow(
//                                             color: CupertinoColors.black,
//                                             blurRadius: 20,
//                                           )
//                                         ]),
//                                   ),
//                                   Row(
//                                     children: <Widget>[
//                                       Icon(
//                                         FontAwesomeIcons.locationArrow,
//                                         size: 10.0,
//                                         color: Colors.white,
//                                       ),
//                                       SizedBox(width: 5.0),
//                                       Text(
//                                         pointOfInterest.city,
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             shadows: <Shadow>[
//                                               Shadow(
//                                                 color: CupertinoColors.black,
//                                                 blurRadius: 5,
//                                               )
//                                             ]),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
