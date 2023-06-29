part of '../../home_screen_loaded_state_widget.dart';

class _BookTypeChipWidget extends StatefulWidget {
  const _BookTypeChipWidget()
      : super(
          key: const Key('bookTypeChipWidget'),
        );

  @override
  State<_BookTypeChipWidget> createState() => _BookTypeChipWidgetState();
}

class _BookTypeChipWidgetState extends State<_BookTypeChipWidget> {
  final List<String> types = [
    'Todos',
    'Romance',
    'Aventura',
    'Comédia',
  ];

  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: Dimensions.huge,
      child: ListView.separated(
        itemCount: types.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.small,
        ),
        separatorBuilder: (final context, final index) {
          return const SizedBox(
            width: Dimensions.xsmall,
          );
        },
        itemBuilder: (final context, final index) {
          final isSelected = index == selectedIndex;
          final labelStyle = _getTextStyle(isSelected, context);
          final colorScheme = Theme.of(context).colorScheme;

          return ChoiceChip(
            label: Text(types[index]),
            labelStyle: labelStyle,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            side: BorderSide(
              color: colorScheme.shadow,
            ),
            backgroundColor: colorScheme.surface,
            selectedColor: colorScheme.primary,
            selected: isSelected,
            onSelected: (final _) => _onSelect(index),
          );
        },
      ),
    );
  }

  void _onSelect(final int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  TextStyle? _getTextStyle(
    final bool isSelected,
    final BuildContext context,
  ) {
    final textTheme = Theme.of(context).textTheme.labelLarge;

    if (isSelected) {
      return textTheme?.copyWith(
        color: Theme.of(context).colorScheme.surface,
      );
    }

    return textTheme;
  }
}
