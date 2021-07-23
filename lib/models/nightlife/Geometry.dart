package models.nightlife

class Geometry {
    Location location;
    Viewport viewport;

    Geometry({this.location, this.viewport});

    factory Geometry.fromJson(Map<String, dynamic> json) {
        return Geometry(
            location: json['location'] != null ? Location.fromJson(json['location']) : null, 
            viewport: json['viewport'] != null ? Viewport.fromJson(json['viewport']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.location != null) {
            data['location'] = this.location.toJson();
        }
        if (this.viewport != null) {
            data['viewport'] = this.viewport.toJson();
        }
        return data;
    }
}