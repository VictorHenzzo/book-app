import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
import 'package:book_app/modules/home/ui/widgets/components/app_bar/home_screen_appbar.dart';
import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreenLoadedStateWidget extends StatelessWidget {
  const HomeScreenLoadedStateWidget({
    required this.state,
    required this.presenter,
  }) : super(key: const Key('homeScreenLoadedStateWidget'));

  final HomeLoadedState state;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: HomeScreenAppBar(
          userImageUrl: state.userImageUrl,
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
