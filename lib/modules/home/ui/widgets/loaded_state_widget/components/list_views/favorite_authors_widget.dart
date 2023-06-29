part of '../../home_screen_loaded_state_widget.dart';

class _FavoriteAuthorsWidget extends StatelessWidget {
  const _FavoriteAuthorsWidget({
    required this.favoriteAuthors,
    required this.presenter,
  }) : super(key: const Key('favoriteAuthorsWidget'));

  final List<AuthorEntity> favoriteAuthors;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.1,
      child: ListView.separated(
        itemCount: favoriteAuthors.length,
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
          final author = favoriteAuthors[index];

          return AuthorListTileWidget(
            author: author,
            key: Key('authorListTileWidget - ${author.id}'),
          );
        },
      ),
    );
  }
}
