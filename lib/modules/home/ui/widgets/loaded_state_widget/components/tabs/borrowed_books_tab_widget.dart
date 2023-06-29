part of '../../home_screen_loaded_state_widget.dart';

class _BorrowedBooksTabWidget extends StatelessWidget {
  const _BorrowedBooksTabWidget()
      : super(
          key: const Key('borrowedBooksTabWidget'),
        );

  @override
  Widget build(final BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning,
            size: 100,
            color: colorScheme.primary,
          ),
          Text(
            'Não implementado!',
            overflow: TextOverflow.ellipsis,
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}