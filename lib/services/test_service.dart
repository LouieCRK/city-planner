// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:uk_city_planner/models/nightlife/NightlifeModel.dart';
//
// Future<NightlifeModel> fetchData() async {
//   final key = 'AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo';
//   final response = await http
//       .get(Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?""location=51.3550048,-2.3744071&""radius=25000&type=nightlife&keyword=nightclub%20bar%20drinks%20music&key=$key'));
//
//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     return NightlifeModel.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load album');
//   }
// }
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatefulWidget {
//   const MyApp({key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   Future<NightlifeModel> futurePlaces;
//
//   @override
//   void initState() {
//     super.initState();
//     futurePlaces = fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<NightlifeModel>(
//             future: futurePlaces,
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Text(snapshot.data.results.toString());
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
