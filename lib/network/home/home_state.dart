part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingState extends HomeState {}

final class CategorySuccessState extends HomeState{
  final List<CategoryLists> categoryLists;

  CategorySuccessState({required this.categoryLists});
}

final class FailState extends HomeState {
  final String message;

  FailState({required this.message});

}