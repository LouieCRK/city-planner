import 'package:uk_city_planner/generated/json/base/json_convert_content.dart';
import 'package:uk_city_planner/generated/json/base/json_field.dart';

class NightlifeModelEntity with JsonConvert<NightlifeModelEntity> {
	@JSONField(name: "html_attributions")
	List<dynamic> htmlAttributions;
	@JSONField(name: "next_page_token")
	String nextPageToken;
	List<NightlifeModelResults> results;
	String status;
}

class NightlifeModelResults with JsonConvert<NightlifeModelResults> {
	@JSONField(name: "business_status")
	String businessStatus;
	NightlifeModelResultsGeometry geometry;
	String icon;
	String name;
	@JSONField(name: "opening_hours")
	NightlifeModelResultsOpeningHours openingHours;
	List<NightlifeModelResultsPhotos> photos;
	@JSONField(name: "place_id")
	String placeId;
	@JSONField(name: "plus_code")
	NightlifeModelResultsPlusCode plusCode;
	@JSONField(name: "price_level")
	int priceLevel;
	double rating;
	String reference;
	String scope;
	List<String> types;
	@JSONField(name: "user_ratings_total")
	int userRatingsTotal;
	String vicinity;
	@JSONField(name: "permanently_closed")
	bool permanentlyClosed;
}

class NightlifeModelResultsGeometry with JsonConvert<NightlifeModelResultsGeometry> {
	NightlifeModelResultsGeometryLocation location;
	NightlifeModelResultsGeometryViewport viewport;
}

class NightlifeModelResultsGeometryLocation with JsonConvert<NightlifeModelResultsGeometryLocation> {
	double lat;
	double lng;
}

class NightlifeModelResultsGeometryViewport with JsonConvert<NightlifeModelResultsGeometryViewport> {
	NightlifeModelResultsGeometryViewportNortheast northeast;
	NightlifeModelResultsGeometryViewportSouthwest southwest;
}

class NightlifeModelResultsGeometryViewportNortheast with JsonConvert<NightlifeModelResultsGeometryViewportNortheast> {
	double lat;
	double lng;
}

class NightlifeModelResultsGeometryViewportSouthwest with JsonConvert<NightlifeModelResultsGeometryViewportSouthwest> {
	double lat;
	double lng;
}

class NightlifeModelResultsOpeningHours with JsonConvert<NightlifeModelResultsOpeningHours> {
	@JSONField(name: "open_now")
	bool openNow;
}

class NightlifeModelResultsPhotos with JsonConvert<NightlifeModelResultsPhotos> {
	int height;
	@JSONField(name: "html_attributions")
	List<String> htmlAttributions;
	@JSONField(name: "photo_reference")
	String photoReference;
	int width;
}

class NightlifeModelResultsPlusCode with JsonConvert<NightlifeModelResultsPlusCode> {
	@JSONField(name: "compound_code")
	String compoundCode;
	@JSONField(name: "global_code")
	String globalCode;
}
