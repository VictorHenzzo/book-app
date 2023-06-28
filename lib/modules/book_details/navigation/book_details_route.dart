import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/core/infra/service_locator/service_locator.dart';
import 'package:book_app/modules/book_details/presentation/bloc/book_details_bloc.dart';
import 'package:book_app/modules/book_details/ui/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsRoute {
  static const String path = '/book-details';

  static Widget of(final BuildContext context) {
    final presenter = BookDetailsBloc(
      fetchBookDescriptionUseCase: ServiceLocator.provide(),
    );
    final book = ModalRoute.of(context)!.settings.arguments as BookEntity;

    return BlocProvider(
      create: (final _) => presenter,
      child: BookDetailsScreen(
        presenter: presenter,
        book: book,
      ),
    );
  }
}
