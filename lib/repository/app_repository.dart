import 'package:burmese_guiter/data/models/course_catetory_response.dart';
import 'package:burmese_guiter/data/models/login_response.dart';
import 'package:burmese_guiter/data/models/signUp_Email_response.dart';
import 'package:burmese_guiter/data/models/signUp_Phone_response.dart';
import 'package:burmese_guiter/uitils/constants.dart';
import 'package:burmese_guiter/uitils/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppRepository {
  final baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      responseType: ResponseType.json,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      });

  final baseOptionsWithToken = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 5000),
      responseType: ResponseType.json,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
         "Authorization": "Bearer ${SecureStorage().getAccessToken()}",
      });

// singup user
  Future signUpUser(String name, String phone, String password,
      String confirmPassword,String phoneOremail) async {
        EasyLoading.show();
    try {
      final dio = Dio(baseOptions);
      Response response = await dio.post(
        '$baseUrl$kEndPointSignUp',
        queryParameters: {
          'name': name,
          phoneOremail : phone,
          'password': password,
          'password_confirm': confirmPassword
        },
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();

        if(phoneOremail == 'email'){
          return SignUpEmailResponse.fromJson(response.data[0]);
        }else {
          return SignUpPhoneResponse.fromJson(response.data[0]);
        }

      } else {
        EasyLoading.dismiss();
        throw response.data["message"]['email'] ?? "ERROR: Unknown  Error";
      }
    } on DioException catch (e) {  
        EasyLoading.dismiss();
        print(e.toString());
      throw e.response?.data["message"] ?? "ERROR: Unknown Error";
    } 
  }

//login user
  Future<LoginResponse> loginUser(String email, String type, String password) async {
    EasyLoading.show();
    try {
      final dio = Dio(baseOptions);
      Response response = await dio.post(
        '$baseUrl$kEndPointLogin',
        queryParameters: {
          type : email,
          'password': password,
          'type': type,
        },
      );

      if (response.statusCode == 200) {
        EasyLoading.dismiss();
        return LoginResponse.fromJson(response.data);
        
      } else {
        EasyLoading.dismiss();
        throw response.data["message"] ?? "ERROR: Unknown  Error";
      }
    } on DioException catch (e) {
      EasyLoading.dismiss();
      throw e.response?.data["message"] ?? "ERROR: Unknown  Error";
    }
  }


  //category
  Future<CourseCategoryResponse> getCategory() async{
    try {
      final dio = Dio(baseOptionsWithToken);
      Response response = await dio.get(kEndPointCategory);

      if(response.statusCode == 200){
        return courseCategoryResponseFromJson(response.toString());
      }else {
        throw response.data["message"] ?? "ERROR: Unknown  Error";
      }

    }on DioException catch(e){
      throw e.response?.data['message'] ?? 'ERROR: Unknown Error';
    }
  }


}
