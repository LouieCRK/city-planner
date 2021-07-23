package models.nightlife

class Location {
    double lat;
    double lng;

    Location({this.lat, this.lng});

    factory Location.fromJson(Map<String, dynamic> json) {
        return Location(
            lat: json['lat'], 
            lng: json['lng'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['lat'] = this.lat;
        data['lng'] = this.lng;
        return data;
    }
}