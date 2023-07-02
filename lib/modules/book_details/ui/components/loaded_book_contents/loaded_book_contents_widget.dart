part of '../../book_details_screen.dart';

class _LoadedBookContentsWidget extends StatelessWidget {
  const _LoadedBookContentsWidget({
    required this.state,
    required this.book,
  }) : super(key: const Key('loadedBookContentsWidget'));

  final BookDetailsLoadedState state;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _BookHeaderWidget(
            book: book,
            isFavorite: state.bookDetails.isFavorite,
          ),
          const SizedBox(
            height: Dimensions.xxsmall,
          ),
          Text(
            state.bookDetails.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: Dimensions.small,
          ),
        ],
      ),
    );
  }
}
