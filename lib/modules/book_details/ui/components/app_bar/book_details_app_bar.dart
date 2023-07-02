part of '../../book_details_screen.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar()
      : super(
          key: const Key('bookDetailsAppBar'),
        );

  @override
  PreferredSizeWidget build(final BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.surface;

    return AppBar(
      iconTheme: IconThemeData(
        color: iconColor,
      ),
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: iconColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
