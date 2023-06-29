part of '../book_details_screen.dart';

class _BookContentsWidget extends StatelessWidget {
  const _BookContentsWidget({
    required this.presenter,
    required this.book,
  }) : super(key: const Key('bookContentsWidget'));

  final BookDetailsPresenter presenter;
  final BookEntity book;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(35),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _BookHeaderWidget(book: book),
            const SizedBox(height: 15),
            _BookDescriptionWidget(
              book: book,
              presenter: presenter,
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
