import 'package:book_app/core/domain/entities/author_entity.dart';
import 'package:book_app/core/domain/entities/book_entity.dart';
import 'package:book_app/modules/book_details/navigation/book_details_route.dart';
import 'package:book_app/modules/home/presentation/bloc/home_bloc.dart';
import 'package:book_app/modules/home/presentation/home_presenter.dart';
import 'package:book_app/theme/dimensions.dart';
import 'package:book_app/widgets/authors/author_list_tile_widget.dart';
import 'package:book_app/widgets/books/book_banner_widget.dart';
import 'package:book_app/widgets/books/book_list_tile_widget.dart';
import 'package:book_app/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

part 'components/app_bar/home_screen_appbar.dart';
part 'components/tabs/borrowed_books_tab_widget.dart';
part 'components/tabs/my_books_tab_widget.dart';
part 'components/texts/section_title_widget.dart';
part 'components/list_views/favorite_books_widget.dart';
part 'components/list_views/favorite_authors_widget.dart';
part 'components/list_views/all_books_widget.dart';
part 'components/chips/book_type_chip_widget.dart';

class HomeScreenLoadedStateWidget extends StatelessWidget {
  const HomeScreenLoadedStateWidget({
    required this.state,
    required this.presenter,
  }) : super(key: const Key('homeScreenLoadedStateWidget'));

  final HomeLoadedState state;
  final HomePresenter presenter;

  @override
  Widget build(final BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: HomeScreenAppBar(
          userImageUrl: state.userImageUrl,
        ),
        body: TabBarView(
          children: [
            _MyBooksTabWidget(
              presenter: presenter,
              state: state,
            ),
            const _BorrowedBooksTabWidget(),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
