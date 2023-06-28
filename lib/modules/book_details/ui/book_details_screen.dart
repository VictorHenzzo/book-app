import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/modules/book_details/presentation/book_details_presenter.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({
    required this.presenter,
    required this.book,
  }) : super(key: const Key('bookDetailsScreen'));

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    return const Scaffold();
  }
}
