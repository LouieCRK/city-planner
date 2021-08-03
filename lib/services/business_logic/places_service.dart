import 'package:uk_city_planner/models/places_model.dart';
import 'package:uk_city_planner/services/networking/places_network_service.dart';

class PlacesService {
  final PlacesNetworkService _placesNetworkService = PlacesNetworkService();

  static final PlacesService _singleton = PlacesService._internal();

  // singleton design pattern to only have one instance of places service and results
  factory PlacesService() {
    return _singleton;
  }

  PlacesService._internal();

  double? latitude;
  double? longitude;

  String? get _latitudeStr => latitude.toString();
  String? get _longitudeStr => longitude.toString();

  bool get _isLocationSet => latitude != null && longitude != null;

  // used for storing responses to prevent multi-requests to places api
  final _placesMemoryStore = <TypeOfPlace, List<Result>>{};
  final plannedPlaces = <Result>[];
  // set user current location into lat/long vars
  void setCurrentLocation(double lat, double lon) {
    latitude = lat;
    longitude = lon;
  }

  // todo - user function to add poi to planner
  void addToPlannedPlaces(Result place) => plannedPlaces.add(place);

  Future<List<Result>?> getPlace(TypeOfPlace typeOfPlace) async {
    if(!_isLocationSet) {
      throw Exception('Location must be set before getting places.');
    }
    // retrieve from memory cache if we have already searched.
    if(_placesMemoryStore.containsKey(typeOfPlace)){
      return _placesMemoryStore[typeOfPlace]!;
    }
    // call the network for new places if we have not retrieved them.
    List<Result>? result;
    try { // try catch to handle errors
      switch (typeOfPlace) {
        case TypeOfPlace.restaurants:
          result = await _placesNetworkService.findRestaurants(
              _latitudeStr!, _longitudeStr!);
          break;
        case TypeOfPlace.nightlife:
          result = await _placesNetworkService.findNightlife(
              _latitudeStr!, _longitudeStr!);
          break;
        case TypeOfPlace.entertainment:
          result = await _placesNetworkService.findEntertainment(
              _latitudeStr!, _longitudeStr!);
          break;
        case TypeOfPlace.sightseeing:
          result = await _placesNetworkService.findSightseeing(
              _latitudeStr!, _longitudeStr!);
          break;
        case TypeOfPlace.shopping:
          result = await _placesNetworkService.findShopping(
              _latitudeStr!, _longitudeStr!);
          break;
        default:
          throw 'This type is not registered as a type of place.';
      }
    } catch (ex) {
      print('Error occured whilst retrieving the data from the network.');
      print('Exception is: $ex');
      return null;
    }
    // store places data within our memory store
    _placesMemoryStore[typeOfPlace] = result;
    return result;
  }
}

// enum use for neat coding practice
enum TypeOfPlace{
  restaurants,
  nightlife,
  entertainment,
  sightseeing,
  shopping,
}