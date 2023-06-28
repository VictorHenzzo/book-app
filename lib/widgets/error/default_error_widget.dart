import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    required this.tryAgain,
    required this.width,
    required this.heigth,
  }) : super(key: const Key('defaultErrorWidget'));

  final VoidCallback tryAgain;
  final double width;
  final double heigth;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: heigth,
      width: width,
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
            size: heigth * 0.1,
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
            'Desculpe, não foi possível carregar o conteúdo neste momento.',
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
