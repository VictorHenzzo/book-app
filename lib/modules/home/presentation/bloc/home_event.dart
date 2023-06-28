part of 'home_bloc.dart';

sealed class HomeEvent {}

final class FetchDependenciesEvent extends HomeEvent {}

final class GoToBookPageEvent extends HomeEvent {
  GoToBookPageEvent({required this.book});

  final BookEntity book;
}
