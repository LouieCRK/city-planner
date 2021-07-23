import 'package:http/http.dart';
import 'package:uk_city_planner/models/nightlife/NightlifeModel.dart';

class HttpService {
  final Uri postUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?""location=51.3550048,-2.3744071&"
      "radius=25000&type=nightlife&keyword=nightclub%20bar%20drinks%20music&key=AIzaSyDqtrPbqvNbhfEtb273GQb4obuRd4-AUuo" as Uri;

  Future<List<NightlifeModel>> getPosts() async {
    Response res = await get(postUrl);
    print(res);

  }
}

