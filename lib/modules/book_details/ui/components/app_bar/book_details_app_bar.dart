part of '../../book_details_screen.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar()
      : super(
          key: const Key('bookDetailsAppBar'),
        );

  //TODO Usar sliver pra dar uma animação interessante, colocar a foto aqui
  @override
  PreferredSizeWidget build(final BuildContext context) {
    final iconColor = Theme.of(context).colorScheme.surface;

    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: iconColor,
      ),
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

  //TODO Fix this height
  @override
  Size get preferredSize => const Size.fromHeight(120);
}
