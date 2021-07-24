// import 'package:http/http.dart' as http;
// import 'package:convert/convert.dart' as convert;
//
// class PlacesService {
//   final key = 'AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo'; // used within url as $key
//   // todo - create variables for users lat/long ready to use within url $lat $long
//
//   Future<List<NightlifeModel>>  async() async {
//     var url =
//         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?""'
//         'location=51.3550048,-2.3744071&""radius=25000&type=nightlife&keyword=nightclub%20bar%20drinks%20music&key=$key' as Uri;
//     var response = await http.get(url);
//     var json = convert.jsonDecode(response.body);
//     // var jsonResults = json['results'] as List;
//     // return jsonResults;
//   }
// }
//
// class NightlifeModel {
// }
