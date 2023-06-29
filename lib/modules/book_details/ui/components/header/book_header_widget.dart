part of '../../book_details_screen.dart';

class _BookHeaderWidget extends StatelessWidget {
  const _BookHeaderWidget({
    required this.book,
    required this.isFavorite,
  }) : super(key: const Key('bookHeaderWidget'));

  final BookEntity book;
  final bool isFavorite;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                book.name,
                style: textTheme.titleLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _FavoriteIconWidget(
              isFavorite: isFavorite,
            ),
          ],
        ),
        Text(
          book.author,
          style: textTheme.bodyLarge,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _FavoriteIconWidget extends StatelessWidget {
  const _FavoriteIconWidget({
    required this.isFavorite,
  }) : super(key: const Key('favoriteIconWidget'));

  final bool isFavorite;

  @override
  Widget build(final BuildContext context) {
    if (isFavorite) {
      return Icon(
        Icons.favorite,
        color: Theme.of(context).colorScheme.primary,
      );
    }

    return Icon(
      Icons.favorite_border,
      color: Theme.of(context).colorScheme.onBackground,
    );
  }
}
