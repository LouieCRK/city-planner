package models.nightlife

class PlusCode {
    String compound_code;
    String global_code;

    PlusCode({this.compound_code, this.global_code});

    factory PlusCode.fromJson(Map<String, dynamic> json) {
        return PlusCode(
            compound_code: json['compound_code'], 
            global_code: json['global_code'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['compound_code'] = this.compound_code;
        data['global_code'] = this.global_code;
        return data;
    }
}