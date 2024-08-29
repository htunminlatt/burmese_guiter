// To parse this JSON data, do
//
//     final signUpEmailResponse = signUpEmailResponseFromJson(jsonString);

import 'dart:convert';

List<SignUpEmailResponse> signUpEmailResponseFromJson(String str) => List<SignUpEmailResponse>.from(json.decode(str).map((x) => SignUpEmailResponse.fromJson(x)));

String signUpEmailResponseToJson(List<SignUpEmailResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignUpEmailResponse {
    bool? success;
    Data? data;

    SignUpEmailResponse({
        this.success,
        this.data,
    });

    factory SignUpEmailResponse.fromJson(Map<String, dynamic> json) => SignUpEmailResponse(
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
    String? email;

    Data({
        this.id,
        this.name,
        this.email,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
    };
}
