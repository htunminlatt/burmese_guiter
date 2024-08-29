// To parse this JSON data, do
//
//     final signUpPhoneResponse = signUpPhoneResponseFromJson(jsonString);

import 'dart:convert';

List<SignUpPhoneResponse> signUpPhoneResponseFromJson(String str) => List<SignUpPhoneResponse>.from(json.decode(str).map((x) => SignUpPhoneResponse.fromJson(x)));

String signUpPhoneResponseToJson(List<SignUpPhoneResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignUpPhoneResponse {
    bool? success;
    Data? data;

    SignUpPhoneResponse({
        this.success,
        this.data,
    });

    factory SignUpPhoneResponse.fromJson(Map<String, dynamic> json) => SignUpPhoneResponse(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? name;
    String? phone;

    Data({
        this.id,
        this.name,
        this.phone,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
    };
}
