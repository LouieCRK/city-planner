class NightlifeModel {
  List<dynamic>? htmlAttributions;
  String? nextPageToken;
  List<Results>? results;
  String? status;

  NightlifeModel({
      this.htmlAttributions, 
      this.nextPageToken, 
      this.results, 
      this.status});

  NightlifeModel.fromJson(dynamic json) {
    if (json["html_attributions"] != null) {
      htmlAttributions = [];
      json["html_attributions"].forEach((v) {
        htmlAttributions?.add(dynamic.fromJson(v));
      });
    }
    nextPageToken = json["next_page_token"];
    if (json["results"] != null) {
      results = [];
      json["results"].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    status = json["status"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (htmlAttributions != null) {
      map["html_attributions"] = htmlAttributions?.map((v) => v.toJson()).toList();
    }
    map["next_page_token"] = nextPageToken;
    if (results != null) {
      map["results"] = results?.map((v) => v.toJson()).toList();
    }
    map["status"] = status;
    return map;
  }

}

class Results {
  String? businessStatus;
  Geometry? geometry;
  String? icon;
  String? name;
  Opening_hours? openingHours;
  List<Photos>? photos;
  String? placeId;
  Plus_code? plusCode;
  int? priceLevel;
  double? rating;
  String? reference;
  String? scope;
  List<String>? types;
  int? userRatingsTotal;
  String? vicinity;

  Results({
      this.businessStatus, 
      this.geometry, 
      this.icon, 
      this.name, 
      this.openingHours, 
      this.photos, 
      this.placeId, 
      this.plusCode, 
      this.priceLevel, 
      this.rating, 
      this.reference, 
      this.scope, 
      this.types, 
      this.userRatingsTotal, 
      this.vicinity});

  Results.fromJson(dynamic json) {
    businessStatus = json["business_status"];
    geometry = json["geometry"] != null ? Geometry.fromJson(json["geometry"]) : null;
    icon = json["icon"];
    name = json["name"];
    openingHours = json["opening_hours"] != null ? Opening_hours.fromJson(json["openingHours"]) : null;
    if (json["photos"] != null) {
      photos = [];
      json["photos"].forEach((v) {
        photos?.add(Photos.fromJson(v));
      });
    }
    placeId = json["place_id"];
    plusCode = json["plus_code"] != null ? Plus_code.fromJson(json["plusCode"]) : null;
    priceLevel = json["price_level"];
    rating = json["rating"];
    reference = json["reference"];
    scope = json["scope"];
    types = json["types"] != null ? json["types"].cast<String>() : [];
    userRatingsTotal = json["user_ratings_total"];
    vicinity = json["vicinity"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["business_status"] = businessStatus;
    if (geometry != null) {
      map["geometry"] = geometry?.toJson();
    }
    map["icon"] = icon;
    map["name"] = name;
    if (openingHours != null) {
      map["opening_hours"] = openingHours?.toJson();
    }
    if (photos != null) {
      map["photos"] = photos?.map((v) => v.toJson()).toList();
    }
    map["place_id"] = placeId;
    if (plusCode != null) {
      map["plus_code"] = plusCode?.toJson();
    }
    map["price_level"] = priceLevel;
    map["rating"] = rating;
    map["reference"] = reference;
    map["scope"] = scope;
    map["types"] = types;
    map["user_ratings_total"] = userRatingsTotal;
    map["vicinity"] = vicinity;
    return map;
  }

}

class Plus_code {
  String? compoundCode;
  String? globalCode;

  Plus_code({
      this.compoundCode, 
      this.globalCode});

  Plus_code.fromJson(dynamic json) {
    compoundCode = json["compound_code"];
    globalCode = json["global_code"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["compound_code"] = compoundCode;
    map["global_code"] = globalCode;
    return map;
  }

}

class Photos {
  int? height;
  List<String>? htmlAttributions;
  String? photoReference;
  int? width;

  Photos({
      this.height, 
      this.htmlAttributions, 
      this.photoReference, 
      this.width});

  Photos.fromJson(dynamic json) {
    height = json["height"];
    htmlAttributions = json["html_attributions"] != null ? json["html_attributions"].cast<String>() : [];
    photoReference = json["photo_reference"];
    width = json["width"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["height"] = height;
    map["html_attributions"] = htmlAttributions;
    map["photo_reference"] = photoReference;
    map["width"] = width;
    return map;
  }

}

class Opening_hours {
  bool? openNow;

  Opening_hours({
      this.openNow});

  Opening_hours.fromJson(dynamic json) {
    openNow = json["open_now"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["open_now"] = openNow;
    return map;
  }

}

class Geometry {
  Location? location;
  Viewport? viewport;

  Geometry({
      this.location, 
      this.viewport});

  Geometry.fromJson(dynamic json) {
    location = json["location"] != null ? Location.fromJson(json["location"]) : null;
    viewport = json["viewport"] != null ? Viewport.fromJson(json["viewport"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (location != null) {
      map["location"] = location?.toJson();
    }
    if (viewport != null) {
      map["viewport"] = viewport?.toJson();
    }
    return map;
  }

}

class Viewport {
  Northeast? northeast;
  Southwest? southwest;

  Viewport({
      this.northeast, 
      this.southwest});

  Viewport.fromJson(dynamic json) {
    northeast = json["northeast"] != null ? Northeast.fromJson(json["northeast"]) : null;
    southwest = json["southwest"] != null ? Southwest.fromJson(json["southwest"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (northeast != null) {
      map["northeast"] = northeast?.toJson();
    }
    if (southwest != null) {
      map["southwest"] = southwest?.toJson();
    }
    return map;
  }

}

class Southwest {
  double? lat;
  double? lng;

  Southwest({
      this.lat, 
      this.lng});

  Southwest.fromJson(dynamic json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = lat;
    map["lng"] = lng;
    return map;
  }

}

class Northeast {
  double? lat;
  double? lng;

  Northeast({
      this.lat, 
      this.lng});

  Northeast.fromJson(dynamic json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = lat;
    map["lng"] = lng;
    return map;
  }

}

class Location {
  double? lat;
  double? lng;

  Location({
      this.lat, 
      this.lng});

  Location.fromJson(dynamic json) {
    lat = json["lat"];
    lng = json["lng"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["lat"] = lat;
    map["lng"] = lng;
    return map;
  }

}