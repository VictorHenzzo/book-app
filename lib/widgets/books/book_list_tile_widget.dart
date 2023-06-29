import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/theme/dimensions.dart';
import 'package:flutter/material.dart';

class BookListTileWidget extends StatelessWidget {
  const BookListTileWidget({
    required this.book,
    required this.onPressed,
    super.key,
  });

  final BookEntity book;
  final Function(BookEntity) onPressed;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onPressed(book),
      child: SizedBox(
        height: screenSize.height * 0.1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                Dimensions.smallBorderRadius,
              ),
              child: Image.network(
                book.imageUrl,
              ),
            ),
            const SizedBox(
              width: Dimensions.xsmall,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.name,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.labelLarge,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    book.author,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodySmall,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
