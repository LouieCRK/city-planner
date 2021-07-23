package models.nightlife

class Southwest {
    double lat;
    double lng;

    Southwest({this.lat, this.lng});

    factory Southwest.fromJson(Map<String, dynamic> json) {
        return Southwest(
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