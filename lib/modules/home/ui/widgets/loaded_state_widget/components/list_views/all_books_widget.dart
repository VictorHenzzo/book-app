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
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allBooks.length,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.small,
      ),
      separatorBuilder: (final context, final index) {
        return const SizedBox(
          height: Dimensions.xsmall,
        );
      },
      itemBuilder: (final context, final index) {
        final book = allBooks[index];

        return BookListTileWidget(
          book: book,
          onPressed: (final book) => _onPressed(
            book,
            context,
          ),
          key: Key('bookListTileWidget - ${book.id}'),
        );
      },
    );
  }

  void _onPressed(
    final BookEntity book,
    final BuildContext context,
  ) {
    Navigator.pushNamed(
      context,
      BookDetailsRoute.path,
      arguments: book,
    );
  }
}
