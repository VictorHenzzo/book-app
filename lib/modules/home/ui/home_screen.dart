import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
import 'package:book_app/modules/home/ui/widgets/home_screen_error_state_widget.dart';
import 'package:book_app/modules/home/ui/widgets/home_screen_loaded_state_widget.dart';
import 'package:book_app/modules/home/ui/widgets/home_screen_loading_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    required this.presenter,
  }) : super(key: const Key('homeScreen')) {
    _fetchDependencies();
  }

  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (final context, final state) {
        return switch (state) {
          final HomeInitialState _ => const HomeScreenLoadingStateWidget(),
          final HomeLoadingState _ => const HomeScreenLoadingStateWidget(),
          final HomeErrorState _ => HomeScreenErrorStateWidget(
              tryAgain: _fetchDependencies,
            ),
          final HomeLoadedState loadedState => HomeScreenLoadedStateWidget(
              state: loadedState,
              presenter: presenter,
            ),
        };
      },
    );
  }

  void _fetchDependencies() {
    presenter.addEvent(
      FetchDependenciesEvent(),
    );
  }
}
