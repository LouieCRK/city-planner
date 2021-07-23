package models.nightlife

class NightlifeModel {
    List<Object> html_attributions;
    String next_page_token;
    List<Result> results;
    String status;

    NightlifeModel({this.html_attributions, this.next_page_token, this.results, this.status});

    factory NightlifeModel.fromJson(Map<String, dynamic> json) {
        return NightlifeModel(
            html_attributions: json['html_attributions'] != null ? (json['html_attributions'] as List).map((i) => Object.fromJson(i)).toList() : null, 
            next_page_token: json['next_page_token'], 
            results: json['results'] != null ? (json['results'] as List).map((i) => Result.fromJson(i)).toList() : null, 
            status: json['status'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['next_page_token'] = this.next_page_token;
        data['status'] = this.status;
        if (this.html_attributions != null) {
            data['html_attributions'] = this.html_attributions.map((v) => v.toJson()).toList();
        }
        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}