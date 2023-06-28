import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
            text: 'SS',
            style: Theme.of(context).textTheme.displayMedium,
            children: <TextSpan>[
              TextSpan(
                text: 'BOOK',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            height: 100,
            child: AspectRatio(
              aspectRatio: 1,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                backgroundImage: const NetworkImage(
                  'https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
