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
          const _SectionTitle(
            sectionTitle: 'Livros favoritos',
          ),
          _FavoriteBooksWidget(
            presenter: presenter,
            favoriteBooks: state.favoriteBooks,
          ),
          const _SectionTitle(
            sectionTitle: 'Autores favoritos',
          ),
          _FavoriteAuthorsWidget(
            favoriteAuthors: state.favoriteAuthors,
            presenter: presenter,
          ),
          const _SectionTitle(
            sectionTitle: 'Biblioteca',
            showNavigationButton: false,
          ),
          _AllBooksWidget(
            allBooks: state.allBooks,
            presenter: presenter,
          ),
        ],
      ),
    );
  }
}
