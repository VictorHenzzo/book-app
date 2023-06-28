import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/modules/book_details/presentation/book_details_presenter.dart';
import 'package:flutter/material.dart';

part 'components/app_bar/book_details_app_bar.dart';
part 'components/header/book_header.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    required this.presenter,
    required this.book,
  }) : super(key: const Key('bookDetailsScreen'));

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BookDetailsAppBar(),
      body: _BookDetailsScreenBody(
        presenter: presenter,
        book: book,
      ),
    );
  }
}

class _BookDetailsScreenBody extends StatelessWidget {
  const _BookDetailsScreenBody({
    required this.presenter,
    required this.book,
  }) : super(key: const Key('bookDetailsScreenBody'));

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          top: 0,
          child: SizedBox(
            width: screenSize.width,
            child: Image.network(
              book.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned.fill(
          top: screenSize.height * 0.4,
          child: SizedBox(
            width: screenSize.width,
            child: BookContents(
              book: book,
              presenter: presenter,
            ),
          ),
        ),
      ],
    );
  }
}

class BookContents extends StatelessWidget {
  const BookContents({
    required this.presenter,
    required this.book,
    super.key,
  });

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          _BookHeader(book: book),
          SingleChildScrollView(
            child: Text('dsa'),
          )
        ],
      ),
    );
  }
}
