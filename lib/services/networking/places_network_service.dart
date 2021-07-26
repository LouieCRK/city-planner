import 'package:http/http.dart';
import 'package:uk_city_planner/models/places_model.dart';

class PlacesNetworkService {
  final key =
      'AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo'; // google places api key - used within url as $key
  var radius = 15000; // just over 9 miles radius

  Future<List<Result>> findRestaurants(String latitude, String longitude) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude&radius=$radius&type=%20cafe%20establishment&keyword=food&key=$key&rankby=prominence';
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body);
    print(responseList);
    final restaurantResults = responseList!.results!;

    return restaurantResults;
  }
}


