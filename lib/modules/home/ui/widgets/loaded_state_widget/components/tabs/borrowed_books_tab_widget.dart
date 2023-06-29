part of '../../home_screen_loaded_state_widget.dart';

class _BorrowedBooksTabWidget extends StatelessWidget {
  const _BorrowedBooksTabWidget()
      : super(
          key: const Key('borrowedBooksTabWidget'),
        );

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.warning,
          size: screenSize.height * 0.15,
          color: primaryColor,
        ),
        Text(
          'Não implementado!',
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: primaryColor,
              ),
        ),
      ],
    );
  }
}
