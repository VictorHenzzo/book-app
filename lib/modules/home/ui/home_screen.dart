import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
import 'package:book_app/modules/home/ui/components/app_bar/home_screen_appbar.dart';
import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    required this.presenter,
  }) : super(key: const Key('homeScreen')) {
    presenter.addEvent(FetchDependenciesEvent());
  }

  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        bottomNavigationBar: const CustomBottomNavigationBar(),
        appBar: const HomeScreenAppBar(
          userImageUrl: 'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg',
        ),
      ),
    );
  }
}
