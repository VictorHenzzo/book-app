part of '../../home_screen_loaded_state_widget.dart';

class _SectionTitleWidget extends StatelessWidget {
  const _SectionTitleWidget({
    required this.sectionTitle,
    this.showNavigationButton = true,
    super.key,
  });

  final String sectionTitle;
  final bool showNavigationButton;

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimensions.small,
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
