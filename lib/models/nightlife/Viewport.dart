package models.nightlife

class Viewport {
    Northeast northeast;
    Southwest southwest;

    Viewport({this.northeast, this.southwest});

    factory Viewport.fromJson(Map<String, dynamic> json) {
        return Viewport(
            northeast: json['northeast'] != null ? Northeast.fromJson(json['northeast']) : null, 
            southwest: json['southwest'] != null ? Southwest.fromJson(json['southwest']) : null, 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.northeast != null) {
            data['northeast'] = this.northeast.toJson();
        }
        if (this.southwest != null) {
            data['southwest'] = this.southwest.toJson();
        }
        return data;
    }
}