package models.nightlife

class Northeast {
    double lat;
    double lng;

    Northeast({this.lat, this.lng});

    factory Northeast.fromJson(Map<String, dynamic> json) {
        return Northeast(
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