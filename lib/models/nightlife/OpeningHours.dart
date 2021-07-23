package models.nightlife

class OpeningHours {
    bool open_now;

    OpeningHours({this.open_now});

    factory OpeningHours.fromJson(Map<String, dynamic> json) {
        return OpeningHours(
            open_now: json['open_now'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['open_now'] = this.open_now;
        return data;
    }
}