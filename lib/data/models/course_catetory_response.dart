// To parse this JSON data, do
//
//     final courseCategoryResponse = courseCategoryResponseFromJson(jsonString);

import 'dart:convert';

CourseCategoryResponse courseCategoryResponseFromJson(String str) => CourseCategoryResponse.fromJson(json.decode(str));

String courseCategoryResponseToJson(CourseCategoryResponse data) => json.encode(data.toJson());

class CourseCategoryResponse {
    bool? success;
    List<CategoryLists>? data;
    dynamic previousUrl;
    dynamic nextUrl;

    CourseCategoryResponse({
        this.success,
        this.data,
        this.previousUrl,
        this.nextUrl,
    });

    factory CourseCategoryResponse.fromJson(Map<String, dynamic> json) => CourseCategoryResponse(
        success: json["success"],
        data: json["data"] == null ? [] : List<CategoryLists>.from(json["data"]!.map((x) => CategoryLists.fromJson(x))),
        previousUrl: json["previous_url"],
        nextUrl: json["next_url"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "previous_url": previousUrl,
        "next_url": nextUrl,
    };
}

class CategoryLists {
    int? id;
    String? nameEng;
    String? nameMm;
    String? logo;

    CategoryLists({
        this.id,
        this.nameEng,
        this.nameMm,
        this.logo,
    });

    factory CategoryLists.fromJson(Map<String, dynamic> json) => CategoryLists(
        id: json["id"],
        nameEng: json["name_eng"],
        nameMm: json["name_mm"],
        logo: json["logo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_eng": nameEng,
        "name_mm": nameMm,
        "logo": logo,
    };
}
