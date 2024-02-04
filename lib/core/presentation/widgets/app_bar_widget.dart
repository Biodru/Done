import 'package:done/config/theme/main_theme.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(color: MainTheme.secondary),
      ),
      iconTheme: const IconThemeData(color: MainTheme.secondary),
      elevation: 5,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
