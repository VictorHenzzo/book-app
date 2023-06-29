part of '../../home_screen_loaded_state_widget.dart';

class _MyBooksTabWidget extends StatelessWidget {
  const _MyBooksTabWidget({
    required this.state,
    required this.presenter,
  }) : super(key: const Key('myBooksTabWidget'));

  final HomeLoadedState state;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          const _SectionTitleWidget(
            sectionTitle: 'Livros favoritos',
            key: Key('sectionTitleWidget - FavoriteBooks'),
          ),
          _FavoriteBooksWidget(
            presenter: presenter,
            favoriteBooks: state.favoriteBooks,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
              ),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: Column(
              children: [
                const SizedBox(height: 25),
                const _SectionTitleWidget(
                  sectionTitle: 'Autores favoritos',
                  key: Key('sectionTitleWidget - FavoriteAuthors'),
                ),
                _FavoriteAuthorsWidget(
                  favoriteAuthors: state.favoriteAuthors,
                  presenter: presenter,
                ),
                const SizedBox(height: 25),
                const _SectionTitleWidget(
                  sectionTitle: 'Biblioteca',
                  showNavigationButton: false,
                  key: Key('sectionTitleWidget - Library'),
                ),
                const SizedBox(height: 25),
                const _BookTypeChipWidget(),
                const SizedBox(height: 25),
                _AllBooksWidget(
                  allBooks: state.allBooks,
                  presenter: presenter,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
