// import 'package:http/http.dart' as http;
// import 'data:convert' as convert;
// import 'package:uk_city_planner/models/nightlife/nightlife_model_entity.dart';
//
//
// class PlacesService {
//   final key = 'AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo';
//
//   Future<List<NightlifeModelResults>> async{
//     var url =
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?""location=51.3550048,-2.3744071&""radius=25000&type=nightlife&keyword=nightclub%20bar%20drinks%20music&key=$key';
//     var response = await http.get(url);
//     var json = convert.jsonDecode(response.body);
//     var jsonResults = json['results'] as List;
//     return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
//   }
// }
//
// // class HttpService {
// //   final Uri postUrl =
// //       "https://maps.googleapis.com/maps/api/place/nearbysearch/json?""location=51.3550048,-2.3744071&"
// //       "radius=25000&type=nightlife&keyword=nightclub%20bar%20drinks%20music&key=$key" as Uri;
// //
// //   Future<List<NightlifeModelResults>> getPosts() async {
// //     Response res = await get(postUrl);
// //     return res;
// //   }
// // }
//
