import 'package:http/http.dart';
import 'package:uk_city_planner/models/places_details_model.dart';
import 'package:uk_city_planner/models/places_model.dart';

class PlacesNetworkService {
  final key =
      'AIzaSyDPFVBgZDnp7Ee-6y8K5vPK_8kTOGfYAZ4'; // google places api key - used within url as $key
  var radius = 10000; // just over 6.2 miles radius

  // fetch restaurant data via google places api
  Future<List<Result>> findRestaurants(
      String latitude, String longitude) async {
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude' // user location
        '&radius=$radius' // radius from users location to produce results with their proximity
        '&type=restaurant%20point_of_interest' // type specification
        '&keyword=food%20dinner%20dining' // keywords for tailored results
        '&key=$key&' // google places API key
        'rankby=prominence'; // ranks POIs by order of prominence
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body); // parse JSON via places model
    final restaurantResults = responseList!.results!;
    return restaurantResults; // return our list of results
  }

  Future<List<Result>> findNightlife(String latitude, String longitude) async {
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude'
        '&radius=15000'
        '&type=point_of_interest'
        '&keyword=club|night_club|bar|drinks|music'
        '&key=$key&rankby=prominence';
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body);
    final nightlifeResults = responseList!.results!;

    return nightlifeResults;
  }

  // todo - update api call to retrieve more relevant poi's
  Future<List<Result>> findEntertainment(
      String latitude, String longitude) async {
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude'
        '&radius=15000'
        '&type=tourist_attraction'
        '&keyword=leisure|fun|cinema|zoo|movie_theater'
        '&key=$key&rankby=prominence';
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body);
    final entertainmentResults = responseList!.results!;

    return entertainmentResults;
  }

  Future<List<Result>> findSightseeing(
      String latitude, String longitude) async {
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude'
        '&radius=20000'
        '&type=tourist_attraction'
        '&keyword=nature|art_gallery|outdoors|museum|history|tour'
        '&key=$key&rankby=prominence';
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body);
    final sightseeingResults = responseList!.results!;

    return sightseeingResults;
  }

  Future<List<Result>> findShopping(String latitude, String longitude) async {
    String url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
        'location=$latitude,$longitude'
        '&radius=$radius'
        '&type=point_of_interest'
        '&keyword=shopping_mall|store|clothes|fashion|department_store'
        '&key=$key&rankby=prominence';
    final response = await get(
      Uri.parse(url),
    );

    FetchedData? responseList = fetchedDataFromJson(response.body);
    final shoppingResults = responseList!.results!;

    return shoppingResults;
  }

// todo - fix details fetch
Future<DetailsResult> findDetailsByID(String placeID) async {
  String url =
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeID&fields=formatted_phone_number,website,review,photo&key=$key';
  final response = await get(
    Uri.parse(url),
  );

  PlaceDetails? responseList = placeDetailsFromJson(response.body);
  final detailsResults = responseList.result;

  return detailsResults;
}

}
