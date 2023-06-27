part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchDependenciesEvent extends HomeEvent {}

class GoToBookPageEvent extends HomeEvent {
  GoToBookPageEvent({required this.book});

  final BookEntity book;
}
