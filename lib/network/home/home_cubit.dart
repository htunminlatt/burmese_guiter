import 'package:bloc/bloc.dart';
import 'package:burmese_guiter/data/models/course_catetory_response.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repository) : super(HomeInitial());
  AppRepository repository;

  getCategoryLists(){
    emit(LoadingState());
    repository.getCategory().then((value) {
      emit(CategorySuccessState(categoryLists: value.data as List<CategoryLists>));
      EasyLoading.dismiss();
    }).catchError((e){
      emit(FailState(message: e.toString()));
      EasyLoading.dismiss();
    });
  }
}
