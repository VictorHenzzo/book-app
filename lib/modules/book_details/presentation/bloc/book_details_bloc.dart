import 'package:bloc/bloc.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/domain/use_cases/books/fetch_book_description_use_case.dart';
import 'package:book_app/modules/book_details/presentation/book_details_presenter.dart';
import 'package:equatable/equatable.dart';

part 'book_details_event.dart';
part 'book_details_state.dart';

class BookDetailsBloc extends Bloc<BookDetailsEvent, BookDetailsState>
    implements BookDetailsPresenter {
  BookDetailsBloc({
    required this.fetchBookDescriptionUseCase,
  }) : super(const BookDetailsInitialState()) {
    on<FetchContentEvent>(_onFetchContentEvent);
  }

  Future<void> _onFetchContentEvent(
    final FetchContentEvent event,
    final Emitter<BookDetailsState> emit,
  ) async {
    emit(const BookDetailsLoadingState());

    final descriptionEither = await fetchBookDescriptionUseCase.fetchBookDescription(
      event.bookEntity.id,
    );

    descriptionEither.fold(
      (final success) => emit(
        BookDetailsLoadedState(bookDetails: success),
      ),
      (final failure) => emit(const BookDetailsErrorState()),
    );
  }

  final FetchBookDescriptionUseCase fetchBookDescriptionUseCase;

  @override
  void addEvent(final BookDetailsEvent event) {
    add(event);
  }
}
