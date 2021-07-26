// To parse this JSON data, do
//
//     final fetchedData = fetchedDataFromJson(jsonString);

import 'dart:convert';

FetchedData? fetchedDataFromJson(String str) =>
    FetchedData?.fromJson(json.decode(str));

class FetchedData {
  FetchedData({
    required this.htmlAttributions,
    required this.nextPageToken,
    required this.results,
    required this.status,
  });

  final List<dynamic>? htmlAttributions;
  final String? nextPageToken;
  final List<Result>? results;
  final String? status;

  factory FetchedData.fromJson(Map<String, dynamic> json) => FetchedData(
        htmlAttributions:
            List<dynamic>.from(json["html_attributions"].map((x) => x)),
        nextPageToken: json["next_page_token"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        status: json["status"],
      );
}

class Result {
  Result({
    required this.businessStatus,
    required this.name,
    required this.openingHours,
    required this.photos,
    required this.placeId,
    required this.priceLevel,
    required this.rating,
    required this.userRatingsTotal,
    required this.vicinity,
  });

  final String? businessStatus;
  final String? name;
  final OpeningHours? openingHours;
  final List<Photo>? photos;
  final String? placeId;
  final int? priceLevel;
  final double? rating;
  final int? userRatingsTotal;
  final String? vicinity;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        businessStatus: json["business_status"],
        name: json["name"],
        openingHours: OpeningHours.fromJson(json["opening_hours"]),
        photos: (json["photos"] == null)? null : List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
        placeId: json["place_id"],
        priceLevel: json["price_level"] == null ? null : json["price_level"],
        rating: json["rating"].toDouble(),
        userRatingsTotal: json["user_ratings_total"],
        vicinity: json["vicinity"],
      );
}

class Geometry {
  Geometry({
    required this.location,
    required this.viewport,
  });

  final Location? location;
  final Viewport? viewport;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        viewport: Viewport.fromJson(json["viewport"]),
      );
}

class Location {
  Location({
    required this.lat,
    required this.lng,
  });

  final double? lat;
  final double? lng;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
      );
}

class Viewport {
  Viewport({
    required this.northeast,
    required this.southwest,
  });

  final Location? northeast;
  final Location? southwest;

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
      );
}

class OpeningHours {
  OpeningHours({
    required this.openNow,
  });

  final bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic>? json) {
    if (json == null){
      return OpeningHours(openNow: null);
    }
    return OpeningHours(
      openNow: json["open_now"],
    );
  }
}

class Photo {
  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  final int? height;
  final List<String>? htmlAttributions;
  final String? photoReference;
  final int? width;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions:
            List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );
}

class PlusCode {
  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  final String? compoundCode;
  final String? globalCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );
}
