import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreenErrorStateWidget extends StatelessWidget {
  const HomeScreenErrorStateWidget({
    required this.tryAgain,
  }) : super(key: const Key('homeScreenErrorStateWidget'));

  final VoidCallback tryAgain;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      body: Center(
        child: _ErrorContainer(
          tryAgain: tryAgain,
        ),
      ),
    );
  }
}

class _ErrorContainer extends StatelessWidget {
  const _ErrorContainer({
    required this.tryAgain,
  });

  final VoidCallback tryAgain;

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: screenSize.height * 0.5,
      width: screenSize.width * 0.8,
      decoration: BoxDecoration(
        color: colorScheme.errorContainer,
        borderRadius: BorderRadius.circular(60),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 5),
          Icon(
            Icons.error,
            size: screenSize.height * 0.1,
            color: colorScheme.error,
          ),
          const Spacer(),
          Text(
            'Oops, algo deu errado!',
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.error,
            ),
          ),
          const Spacer(),
          Text(
            'Desculpe, não foi possível carregar o conteúdo neste momento.\nPor favor, verifique sua conexão com a internet e tente novamente.',
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: tryAgain,
            child: Text(
              'Tentar Novamente',
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelLarge,
            ),
          ),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
