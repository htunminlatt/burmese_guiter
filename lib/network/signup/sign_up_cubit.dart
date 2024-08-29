import 'package:bloc/bloc.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.repository) : super(SignUpInitial());

  final AppRepository repository;

  signUpUser(String email, String phone, String password,String passwordconfirm,String phoneOremail) {
    emit(LoadingState());
    
    repository.signUpUser(email, phone,password,passwordconfirm,phoneOremail).then((value) {
      EasyLoading.dismiss();
      emit(SuccessState());
    }).catchError((e) {
      emit(FailSignUpState(message: e.toString()));
      EasyLoading.dismiss();
    });
  }
}
