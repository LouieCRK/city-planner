import 'package:uk_city_planner/models/nightlife/nightlife_model_entity.dart';

nightlifeModelEntityFromJson(NightlifeModelEntity data, Map<String, dynamic> json) {
	if (json['html_attributions'] != null) {
		data.htmlAttributions = (json['html_attributions'] as List).map((v) => v).toList().cast<dynamic>();
	}
	if (json['next_page_token'] != null) {
		data.nextPageToken = json['next_page_token'].toString();
	}
	if (json['results'] != null) {
		data.results = (json['results'] as List).map((v) => NightlifeModelResults().fromJson(v)).toList();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	return data;
}

Map<String, dynamic> nightlifeModelEntityToJson(NightlifeModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['html_attributions'] = entity.htmlAttributions;
	data['next_page_token'] = entity.nextPageToken;
	data['results'] =  entity.results?.map((v) => v.toJson())?.toList();
	data['status'] = entity.status;
	return data;
}

nightlifeModelResultsFromJson(NightlifeModelResults data, Map<String, dynamic> json) {
	if (json['business_status'] != null) {
		data.businessStatus = json['business_status'].toString();
	}
	if (json['geometry'] != null) {
		data.geometry = NightlifeModelResultsGeometry().fromJson(json['geometry']);
	}
	if (json['icon'] != null) {
		data.icon = json['icon'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['opening_hours'] != null) {
		data.openingHours = NightlifeModelResultsOpeningHours().fromJson(json['opening_hours']);
	}
	if (json['photos'] != null) {
		data.photos = (json['photos'] as List).map((v) => NightlifeModelResultsPhotos().fromJson(v)).toList();
	}
	if (json['place_id'] != null) {
		data.placeId = json['place_id'].toString();
	}
	if (json['plus_code'] != null) {
		data.plusCode = NightlifeModelResultsPlusCode().fromJson(json['plus_code']);
	}
	if (json['price_level'] != null) {
		data.priceLevel = json['price_level'] is String
				? int.tryParse(json['price_level'])
				: json['price_level'].toInt();
	}
	if (json['rating'] != null) {
		data.rating = json['rating'] is String
				? double.tryParse(json['rating'])
				: json['rating'].toDouble();
	}
	if (json['reference'] != null) {
		data.reference = json['reference'].toString();
	}
	if (json['scope'] != null) {
		data.scope = json['scope'].toString();
	}
	if (json['types'] != null) {
		data.types = (json['types'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['user_ratings_total'] != null) {
		data.userRatingsTotal = json['user_ratings_total'] is String
				? int.tryParse(json['user_ratings_total'])
				: json['user_ratings_total'].toInt();
	}
	if (json['vicinity'] != null) {
		data.vicinity = json['vicinity'].toString();
	}
	if (json['permanently_closed'] != null) {
		data.permanentlyClosed = json['permanently_closed'];
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsToJson(NightlifeModelResults entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['business_status'] = entity.businessStatus;
	data['geometry'] = entity.geometry?.toJson();
	data['icon'] = entity.icon;
	data['name'] = entity.name;
	data['opening_hours'] = entity.openingHours?.toJson();
	data['photos'] =  entity.photos?.map((v) => v.toJson())?.toList();
	data['place_id'] = entity.placeId;
	data['plus_code'] = entity.plusCode?.toJson();
	data['price_level'] = entity.priceLevel;
	data['rating'] = entity.rating;
	data['reference'] = entity.reference;
	data['scope'] = entity.scope;
	data['types'] = entity.types;
	data['user_ratings_total'] = entity.userRatingsTotal;
	data['vicinity'] = entity.vicinity;
	data['permanently_closed'] = entity.permanentlyClosed;
	return data;
}

nightlifeModelResultsGeometryFromJson(NightlifeModelResultsGeometry data, Map<String, dynamic> json) {
	if (json['location'] != null) {
		data.location = NightlifeModelResultsGeometryLocation().fromJson(json['location']);
	}
	if (json['viewport'] != null) {
		data.viewport = NightlifeModelResultsGeometryViewport().fromJson(json['viewport']);
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsGeometryToJson(NightlifeModelResultsGeometry entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['location'] = entity.location?.toJson();
	data['viewport'] = entity.viewport?.toJson();
	return data;
}

nightlifeModelResultsGeometryLocationFromJson(NightlifeModelResultsGeometryLocation data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat'] is String
				? double.tryParse(json['lat'])
				: json['lat'].toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng'] is String
				? double.tryParse(json['lng'])
				: json['lng'].toDouble();
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsGeometryLocationToJson(NightlifeModelResultsGeometryLocation entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

nightlifeModelResultsGeometryViewportFromJson(NightlifeModelResultsGeometryViewport data, Map<String, dynamic> json) {
	if (json['northeast'] != null) {
		data.northeast = NightlifeModelResultsGeometryViewportNortheast().fromJson(json['northeast']);
	}
	if (json['southwest'] != null) {
		data.southwest = NightlifeModelResultsGeometryViewportSouthwest().fromJson(json['southwest']);
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsGeometryViewportToJson(NightlifeModelResultsGeometryViewport entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['northeast'] = entity.northeast?.toJson();
	data['southwest'] = entity.southwest?.toJson();
	return data;
}

nightlifeModelResultsGeometryViewportNortheastFromJson(NightlifeModelResultsGeometryViewportNortheast data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat'] is String
				? double.tryParse(json['lat'])
				: json['lat'].toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng'] is String
				? double.tryParse(json['lng'])
				: json['lng'].toDouble();
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsGeometryViewportNortheastToJson(NightlifeModelResultsGeometryViewportNortheast entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

nightlifeModelResultsGeometryViewportSouthwestFromJson(NightlifeModelResultsGeometryViewportSouthwest data, Map<String, dynamic> json) {
	if (json['lat'] != null) {
		data.lat = json['lat'] is String
				? double.tryParse(json['lat'])
				: json['lat'].toDouble();
	}
	if (json['lng'] != null) {
		data.lng = json['lng'] is String
				? double.tryParse(json['lng'])
				: json['lng'].toDouble();
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsGeometryViewportSouthwestToJson(NightlifeModelResultsGeometryViewportSouthwest entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['lat'] = entity.lat;
	data['lng'] = entity.lng;
	return data;
}

nightlifeModelResultsOpeningHoursFromJson(NightlifeModelResultsOpeningHours data, Map<String, dynamic> json) {
	if (json['open_now'] != null) {
		data.openNow = json['open_now'];
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsOpeningHoursToJson(NightlifeModelResultsOpeningHours entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['open_now'] = entity.openNow;
	return data;
}

nightlifeModelResultsPhotosFromJson(NightlifeModelResultsPhotos data, Map<String, dynamic> json) {
	if (json['height'] != null) {
		data.height = json['height'] is String
				? int.tryParse(json['height'])
				: json['height'].toInt();
	}
	if (json['html_attributions'] != null) {
		data.htmlAttributions = (json['html_attributions'] as List).map((v) => v.toString()).toList().cast<String>();
	}
	if (json['photo_reference'] != null) {
		data.photoReference = json['photo_reference'].toString();
	}
	if (json['width'] != null) {
		data.width = json['width'] is String
				? int.tryParse(json['width'])
				: json['width'].toInt();
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsPhotosToJson(NightlifeModelResultsPhotos entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['height'] = entity.height;
	data['html_attributions'] = entity.htmlAttributions;
	data['photo_reference'] = entity.photoReference;
	data['width'] = entity.width;
	return data;
}

nightlifeModelResultsPlusCodeFromJson(NightlifeModelResultsPlusCode data, Map<String, dynamic> json) {
	if (json['compound_code'] != null) {
		data.compoundCode = json['compound_code'].toString();
	}
	if (json['global_code'] != null) {
		data.globalCode = json['global_code'].toString();
	}
	return data;
}

Map<String, dynamic> nightlifeModelResultsPlusCodeToJson(NightlifeModelResultsPlusCode entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['compound_code'] = entity.compoundCode;
	data['global_code'] = entity.globalCode;
	return data;
}