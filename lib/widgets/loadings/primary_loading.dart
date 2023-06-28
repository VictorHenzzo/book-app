import 'package:flutter/material.dart';

class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({super.key});

  @override
  Widget build(final BuildContext context) {
    return CircularProgressIndicator(
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
