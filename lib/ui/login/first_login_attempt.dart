import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 800,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/svg/login-banner.png'),
                    fit: BoxFit.fill
                  ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                         )
                      ]
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey[100]))
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Username or Email",
                              hintStyle: TextStyle(color: Colors.grey[400])
                            ),
                          )
                        )
                      ]
                    )
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }



}


// return Scaffold(
//     body: Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topRight,
//           end: Alignment.bottomLeft,
//           colors: [Colors.teal, Colors.cyan],
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     height: 400,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage('assets/svg/login-banner.svg')
//                       )
//                     )
//                   )
//                 ]
//               )
//             ),
//         )
//       )
//     );