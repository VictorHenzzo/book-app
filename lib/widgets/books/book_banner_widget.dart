import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

class BookBannerWidget extends StatelessWidget {
  const BookBannerWidget(
      {required this.book, required this.onPressed, required this.width, required this.heigth})
      : super(key: const Key('bookBannerWidget'));

  final BookEntity book;
  final Function(BookEntity) onPressed;
  final double width;
  final double heigth;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: width,
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
          const SizedBox(height: 5),
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
          )
        ],
      ),
    );
  }
}
