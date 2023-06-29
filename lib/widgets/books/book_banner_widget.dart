import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/theme/dimensions.dart';
import 'package:flutter/material.dart';

class BookBannerWidget extends StatelessWidget {
  const BookBannerWidget({
    required this.book,
    required this.onPressed,
    required this.heigth,
    super.key,
  });

  final BookEntity book;
  final Function(BookEntity) onPressed;
  //TODO Remove this
  final double heigth;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    // TODO Make all width equal

    return GestureDetector(
      onTap: () => onPressed(book),
      child: SizedBox(
        width: screenSize.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                book.imageUrl,
                height: heigth * 0.7,
              ),
            ),
            const SizedBox(
              height: Dimensions.xxsmall,
            ),
            Text(
              book.name,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelLarge,
              maxLines: 2,
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
    );
  }
}
