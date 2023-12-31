import 'package:done/config/theme/main_theme.dart' as app_theme;
import 'package:flutter/material.dart';

typedef FunctionWithInteger = Function(int);

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    super.key,
    required this.buttonIndex,
    required this.onTap,
    required this.currentIndex,
    required this.selectedIcon,
    required this.unselectedIcon,
  });

  final int buttonIndex;
  final int currentIndex;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final FunctionWithInteger onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(buttonIndex),
      icon: Icon(
        currentIndex == buttonIndex ? selectedIcon : unselectedIcon,
        color: currentIndex == buttonIndex ? app_theme.MainTheme.primary : null,
      ),
    );
  }
}
