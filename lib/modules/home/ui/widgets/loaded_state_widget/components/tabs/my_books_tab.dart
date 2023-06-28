part of '../../home_screen_loaded_state_widget.dart';

class _MyBooksTab extends StatelessWidget {
  const _MyBooksTab({
    required this.state,
    required this.presenter,
  });

  final HomeLoadedState state;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 25),
          const _SectionTitle(
            sectionTitle: 'Livros favoritos',
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
                const _SectionTitle(
                  sectionTitle: 'Autores favoritos',
                ),
                _FavoriteAuthorsWidget(
                  favoriteAuthors: state.favoriteAuthors,
                  presenter: presenter,
                ),
                const SizedBox(height: 25),
                const _SectionTitle(
                  sectionTitle: 'Biblioteca',
                  showNavigationButton: false,
                ),
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
