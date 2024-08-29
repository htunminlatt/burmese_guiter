

import 'package:get_storage/get_storage.dart';

enum SecureDataList { token, fCMToken, isAlreadyLogin, isSignedIn, authToken,accessToken }

class SecureStorage {
  saveAuthStatus (String status) async{
    await  GetStorage().write(SecureDataList.isSignedIn.name, status);
  }

  saveAccessToken (String status) async{
    await  GetStorage().write(SecureDataList.accessToken.name, status);
  }


//
  getAuthStatus () {
    return GetStorage().read(SecureDataList.isSignedIn.name);
  }

  getAccessToken () {
    return GetStorage().read(SecureDataList.accessToken.name);
  }
}