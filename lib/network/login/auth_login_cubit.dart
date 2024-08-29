import 'package:bloc/bloc.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:burmese_guiter/uitils/secure_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'auth_login_state.dart';

class AuthLoginCubit extends Cubit<AuthLoginState> {
  AuthLoginCubit(this.repository) : super(AuthLoginInitial());

  final AppRepository repository;

  loginUser(String email, String password, String type) {
    emit(AuthLoginState());
    repository.loginUser(email, type, password).then((value) {
      emit(LoginSuccessState());
      SecureStorage().saveAccessToken(value.accessToken);
    }).catchError((e) {
      emit(FailState(e.toString()));
      EasyLoading.dismiss();
    });
  }
 
}
