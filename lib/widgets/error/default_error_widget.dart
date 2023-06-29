import 'package:book_app/theme/dimensions.dart';
import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    required this.tryAgain,
  }) : super(key: const Key('defaultErrorWidget'));

  final VoidCallback tryAgain;

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final screenSize = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: colorScheme.error,
          size: screenSize.height * 0.1,
        ),
        Text(
          'Oops, algo deu errado!',
          overflow: TextOverflow.ellipsis,
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.error,
          ),
        ),
        const SizedBox(
          height: Dimensions.small,
        ),
        Text(
          'Desculpe, não foi possível carregar o conteúdo neste momento.',
          style: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Dimensions.small,
        ),
        ElevatedButton(
          onPressed: tryAgain,
          child: Text(
            'Tentar Novamente',
            overflow: TextOverflow.ellipsis,
            style: textTheme.labelLarge,
          ),
        ),
      ],
    );
  }
}
