part of '../book_details_screen.dart';

class _BookContentsWidget extends StatelessWidget {
  _BookContentsWidget({
    required this.presenter,
    required this.book,
  }) : super(key: const Key('bookContentsWidget')) {
    _fetchDescription();
  }

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _BookHeaderWidget(book: book),
            //TODO Create size tokens
            const SizedBox(height: 15),
            BlocBuilder<BookDetailsBloc, BookDetailsState>(
              builder: (final context, final state) {
                return switch (state) {
                  final BookDetailsInitialState _ => const PrimaryLoadingWidget(),
                  final BookDetailsLoadingState _ => const PrimaryLoadingWidget(),
                  final BookDetailsErrorState _ => DefaultErrorWidget(
                      tryAgain: _fetchDescription,
                    ),
                  final BookDetailsLoadedState loadedState => Text(
                      loadedState.bookDetails.description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                };
              },
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
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
