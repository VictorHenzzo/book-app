part of '../../book_details_screen.dart';

class _BookDescriptionWidget extends StatelessWidget {
  _BookDescriptionWidget({
    required this.presenter,
    required this.book,
  }) : super(key: const Key('bookDescriptionWidget')) {
    _fetchDescription();
  }

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return BlocBuilder<BookDetailsBloc, BookDetailsState>(
      builder: (final context, final state) {
        return switch (state) {
          final BookDetailsInitialState _ => const PrimaryLoading(),
          final BookDetailsLoadingState _ => const PrimaryLoading(),
          final BookDetailsErrorState _ => DefaultErrorWidget(
              tryAgain: _fetchDescription,
              width: screenSize.width * 0.75,
              heigth: screenSize.height * 0.35,
            ),
          final BookDetailsLoadedState loadedState => Text(
              loadedState.bookDetails,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
        };
      },
    );
  }

  void _fetchDescription() {
    presenter.addEvent(
      FetchContentEvent(
        bookEntity: book,
      ),
    );
  }
}
