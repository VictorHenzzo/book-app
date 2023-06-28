import 'package:bloc/bloc.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState> {
  BookDetailsBloc() : super(const BookDetailsInitialState()) {
    on<BookDetailsEvent>((event, emit) {});
  }
}
