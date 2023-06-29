part of '../../home_screen_loaded_state_widget.dart';

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.sectionTitle,
    this.showNavigationButton = true,
  }) : super(key: const Key('sectionTitle'));

  final String sectionTitle;
  final bool showNavigationButton;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (showNavigationButton)
            TextButton(
              onPressed: () {},
              child: const Text('ver todos'),
            ),
        ],
      ),
    );
  }
}
