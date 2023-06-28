import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({
    required this.userImageUrl,
  }) : super(key: const Key('homeScreenAppBar'));

  final String userImageUrl;

  @override
  PreferredSizeWidget build(final BuildContext context) {
    return AppBar(
      elevation: 2,
      shadowColor: Theme.of(context).colorScheme.background,
      title: _AppBarTitle(
        userImageUrl: userImageUrl,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(35),
        ),
      ),
      bottom: TabBar(
        labelColor: Theme.of(context).colorScheme.onBackground,
        labelStyle: Theme.of(context).textTheme.titleMedium,
        isScrollable: true,
        //TODO Fix the alignment
        tabAlignment: TabAlignment.start,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 4,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        tabs: const [
          Tab(text: 'Meus livros'),
          Tab(text: 'Emprestados'),
        ],
      ),
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(120);
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({
    required this.userImageUrl,
  });

  final String userImageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: 'SS',
            style: Theme.of(context).textTheme.displayLarge,
            children: <TextSpan>[
              TextSpan(
                text: 'BOOK',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 40,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImageUrl,
            ),
          ),
        ),
      ],
    );
  }
}
