import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/modules/book_details/presentation/bloc/book_details_bloc.dart';
import 'package:book_app/modules/book_details/presentation/book_details_presenter.dart';
import 'package:book_app/theme/dimensions.dart';
import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:book_app/widgets/error/default_error_widget.dart';
import 'package:book_app/widgets/loadings/primary_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'components/app_bar/book_details_app_bar.dart';
part 'components/book_contents_widget.dart';
part 'components/header/book_header_widget.dart';
part 'components/loaded_book_contents/loaded_book_contents_widget.dart';

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
      bottomNavigationBar: const CustomBottomNavigationBar(),
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
          child: _BookContentsWidget(
            book: book,
            presenter: presenter,
          ),
        ),
      ],
    );
  }
}
