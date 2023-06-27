import 'package:book_app/core/infra/service_locator/service_locator.dart';
import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeRoute {
  static String path = '/';

  static Widget of() {
    final presenter = HomeBloc(
      fetchUserImageUseCase: ServiceLocator.provide(),
      fetchAllBooksUseCase: ServiceLocator.provide(),
      fetchFavoriteBooksUseCase: ServiceLocator.provide(),
      fetchFavoriteAuthorsUseCase: ServiceLocator.provide(),
    );

    return BlocProvider(
      create: (final _) => presenter,
      child: HomeScreen(presenter: presenter),
    );
  }
}
