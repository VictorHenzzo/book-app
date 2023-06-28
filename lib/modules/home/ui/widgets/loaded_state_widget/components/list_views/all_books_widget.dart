part of '../../home_screen_loaded_state_widget.dart';

class _AllBooksWidget extends StatelessWidget {
  const _AllBooksWidget({
    required this.allBooks,
    required this.presenter,
  }) : super(key: const Key('allBooksWidget'));

  final List<BookEntity> allBooks;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return ListView.separated(
      //TODO study shrinkWrap
      shrinkWrap: true,
      //TODO Find better way to do this
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allBooks.length,
      separatorBuilder: (final context, final index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (final context, final index) {
        final book = allBooks[index];

        return BookListTileWidget(
          book: book,
          onPressed: _onPressed,
        );
      },
    );
  }

  void _onPressed(final BookEntity book) {
    presenter.addEvent(
      GoToBookPageEvent(book: book),
    );
  }
}
