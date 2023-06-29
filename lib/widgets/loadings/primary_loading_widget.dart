import 'package:flutter/material.dart';

class PrimaryLoadingWidget extends StatelessWidget {
  const PrimaryLoadingWidget({super.key});

  @override
  Widget build(final BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
