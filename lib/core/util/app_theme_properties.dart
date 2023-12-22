import 'package:done/config/theme/main_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProperties {
  static final shadow = BoxShadow(
    color: MainTheme.secondary.withOpacity(0.5),
    spreadRadius: 4,
    blurRadius: 15,
    offset: const Offset(0, 8), // changes position of shadow
  );
}
