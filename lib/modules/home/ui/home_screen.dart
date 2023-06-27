import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    required this.presenter,
  }) : super(key: const Key('homeScreen')) {
    presenter.addEvent(FetchDependenciesEvent());
  }

  final HomePresenter presenter;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
