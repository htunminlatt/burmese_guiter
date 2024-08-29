// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    int userId;
    String accessToken;

    LoginResponse({
        required this.userId,
        required this.accessToken,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        userId: json["user_id"],
        accessToken: json["access_token"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "access_token": accessToken,
    };
}
