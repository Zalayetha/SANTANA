import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF11325F),
          fontSize: 20,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new), // Use your custom icon
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: const Color.fromRGBO(249, 249, 249, 1),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
