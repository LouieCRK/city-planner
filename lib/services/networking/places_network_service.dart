import 'package:http/http.dart';
import 'package:uk_city_planner/models/places_model.dart';

class PlacesNetworkService {
  final key =
      'AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo'; // google places api key - used within url as $key
  var radius = 24140.2;

  Future<List<Result>> findRestaurants(String latitude, String longitude) async {
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude&radius=$radius&type=%20cafe%20establishment&keyword=food&key=$key';
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body);
    if (responseList!.status == "ZERO_RESULTS"){
      radius = 100000;
      findRestaurants(latitude, longitude);
    }

    final restaurantResults = responseList!.results!;

    return restaurantResults;
  }
}


