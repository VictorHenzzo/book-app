part of '../../book_details_screen.dart';

class BookDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookDetailsAppBar()
      : super(
          key: const Key('bookDetailsAppBar'),
        );

  //TODO Usar sliver pra dar uma animação interessante, colocar a foto aqui
  @override
  PreferredSizeWidget build(final BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.surface,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
      ],
    );
  }

  //TODO Fix this height
  @override
  Size get preferredSize => const Size.fromHeight(120);
}
