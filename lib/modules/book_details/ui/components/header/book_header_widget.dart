part of '../../book_details_screen.dart';

class _BookHeaderWidget extends StatelessWidget {
  const _BookHeaderWidget({
    required this.book,
  }) : super(key: const Key('bookHeaderWidget'));

  final BookEntity book;

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
            Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.primary,
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
