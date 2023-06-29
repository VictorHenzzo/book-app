import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:book_app/widgets/loadings/primary_loading_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenLoadingStateWidget extends StatelessWidget {
  const HomeScreenLoadingStateWidget()
      : super(
          key: const Key('homeScreenLoadingStateWidget'),
        );

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const PrimaryLoadingWidget(),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
