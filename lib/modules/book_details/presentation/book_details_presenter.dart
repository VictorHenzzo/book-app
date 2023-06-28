import 'package:book_app/modules/book_details/presentation/bloc/book_details_bloc.dart';

abstract class BookDetailsPresenter {
  void addEvent(final BookDetailsEvent event);
}
