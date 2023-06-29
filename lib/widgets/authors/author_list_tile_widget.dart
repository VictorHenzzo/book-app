import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/theme/dimensions.dart';
import 'package:flutter/material.dart';

class AuthorListTileWidget extends StatelessWidget {
  const AuthorListTileWidget({
    required this.author,
    super.key,
  });

  final AuthorEntity author;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;
    const borderRadius = 15.0;

    return Container(
      width: screenSize.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: Theme.of(context).colorScheme.shadow,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.network(
              author.imageUrl,
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
                  author.name,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelLarge,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                ),
                Text(
                  '${author.booksCount} livros',
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
    );
  }
}
