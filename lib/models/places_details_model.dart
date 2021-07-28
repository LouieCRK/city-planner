import 'dart:convert';

PlaceDetails? placeDetailsFromJson(String str) =>
    PlaceDetails.fromJson(json.decode(str));

class PlaceDetails {
  PlaceDetails({
    required this.details,
    required this.status,
  });

  final Details? details;
  final String? status;

  factory PlaceDetails.fromJson(Map<String?, dynamic> json) => PlaceDetails(
        details: Details.fromJson(json["details"]),
        status: json["status"],
      );
}

class Details {
  Details({
    required this.formattedPhoneNumber,
    required this.website,
  });

  final String formattedPhoneNumber;
  final String website;

  factory Details.fromJson(Map<String?, dynamic> json) => Details(
        formattedPhoneNumber: json["formatted_phone_number"],
        website: json["website"],
      );
}
