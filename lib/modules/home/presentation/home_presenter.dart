import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';

abstract class HomePresenter {
  void addEvent(final HomeEvent event);
}
