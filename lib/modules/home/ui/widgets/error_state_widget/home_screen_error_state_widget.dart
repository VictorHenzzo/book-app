import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:book_app/widgets/error/default_error_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenErrorStateWidget extends StatelessWidget {
  const HomeScreenErrorStateWidget({
    required this.tryAgain,
  }) : super(key: const Key('homeScreenErrorStateWidget'));

  final VoidCallback tryAgain;

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Center(
        child: DefaultErrorWidget(
          tryAgain: tryAgain,
          width: screenSize.width * 0.8,
          heigth: screenSize.height * 0.5,
        ),
      ),
    );
  }
}
