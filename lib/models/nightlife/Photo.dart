package models.nightlife

class Photo {
    int height;
    List<String> html_attributions;
    String photo_reference;
    int width;

    Photo({this.height, this.html_attributions, this.photo_reference, this.width});

    factory Photo.fromJson(Map<String, dynamic> json) {
        return Photo(
            height: json['height'], 
            html_attributions: json['html_attributions'] != null ? new List<String>.from(json['html_attributions']) : null, 
            photo_reference: json['photo_reference'], 
            width: json['width'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['height'] = this.height;
        data['photo_reference'] = this.photo_reference;
        data['width'] = this.width;
        if (this.html_attributions != null) {
            data['html_attributions'] = this.html_attributions;
        }
        return data;
    }
}