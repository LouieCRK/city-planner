package models.nightlife

class Result {
    String business_status;
    Geometry geometry;
    String icon;
    String name;
    OpeningHours opening_hours;
    bool permanently_closed;
    List<Photo> photos;
    String place_id;
    PlusCode plus_code;
    int price_level;
    double rating;
    String reference;
    String scope;
    List<String> types;
    int user_ratings_total;
    String vicinity;

    Result({this.business_status, this.geometry, this.icon, this.name, this.opening_hours, this.permanently_closed, this.photos, this.place_id, this.plus_code, this.price_level, this.rating, this.reference, this.scope, this.types, this.user_ratings_total, this.vicinity});

    factory Result.fromJson(Map<String, dynamic> json) {
        return Result(
            business_status: json['business_status'], 
            geometry: json['geometry'] != null ? Geometry.fromJson(json['geometry']) : null, 
            icon: json['icon'], 
            name: json['name'], 
            opening_hours: json['opening_hours'] != null ? OpeningHours.fromJson(json['opening_hours']) : null, 
            permanently_closed: json['permanently_closed'], 
            photos: json['photos'] != null ? (json['photos'] as List).map((i) => Photo.fromJson(i)).toList() : null, 
            place_id: json['place_id'], 
            plus_code: json['plus_code'] != null ? PlusCode.fromJson(json['plus_code']) : null, 
            price_level: json['price_level'], 
            rating: json['rating'], 
            reference: json['reference'], 
            scope: json['scope'], 
            types: json['types'] != null ? new List<String>.from(json['types']) : null, 
            user_ratings_total: json['user_ratings_total'], 
            vicinity: json['vicinity'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['business_status'] = this.business_status;
        data['icon'] = this.icon;
        data['name'] = this.name;
        data['permanently_closed'] = this.permanently_closed;
        data['place_id'] = this.place_id;
        data['price_level'] = this.price_level;
        data['rating'] = this.rating;
        data['reference'] = this.reference;
        data['scope'] = this.scope;
        data['user_ratings_total'] = this.user_ratings_total;
        data['vicinity'] = this.vicinity;
        if (this.geometry != null) {
            data['geometry'] = this.geometry.toJson();
        }
        if (this.opening_hours != null) {
            data['opening_hours'] = this.opening_hours.toJson();
        }
        if (this.photos != null) {
            data['photos'] = this.photos.map((v) => v.toJson()).toList();
        }
        if (this.plus_code != null) {
            data['plus_code'] = this.plus_code.toJson();
        }
        if (this.types != null) {
            data['types'] = this.types;
        }
        return data;
    }
}