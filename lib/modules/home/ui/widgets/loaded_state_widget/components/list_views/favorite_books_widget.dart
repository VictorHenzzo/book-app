part of '../../home_screen_loaded_state_widget.dart';

class _FavoriteBooksWidget extends StatelessWidget {
  const _FavoriteBooksWidget({
    required this.favoriteBooks,
    required this.presenter,
  });

  final List<BookEntity> favoriteBooks;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.35,
      child: ListView.separated(
        itemCount: favoriteBooks.length,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (final context, final index) {
          return const SizedBox(width: 10);
        },
        itemBuilder: (final context, final index) {
          final book = favoriteBooks[index];

          return BookBannerWidget(
            book: book,
            onPressed: _onPressed,
            heigth: screenSize.height * 0.35,
            key: Key('bookBannerWidget ${book.id}'),
          );
        },
      ),
    );
  }

  void _onPressed(final BookEntity book) {
    presenter.addEvent(
      GoToBookPageEvent(book: book),
    );
  }
}
