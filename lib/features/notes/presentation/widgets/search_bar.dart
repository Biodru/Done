import 'package:done/config/theme/main_theme.dart';
import 'package:done/core/util/app_theme_properties.dart';
import 'package:flutter/material.dart';

class NotesSearchBar extends StatelessWidget {
  const NotesSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        //TODO: Remove hardcoded strings
        hintText: 'Szukaj notatki',
        hintStyle: const TextStyle(
          fontSize: 14,
          color: MainTheme.accent,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}

class AnimatedSearchBar extends StatefulWidget {
  const AnimatedSearchBar({super.key});

  @override
  State<AnimatedSearchBar> createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastEaseInToSlowEaseOut,
      duration: const Duration(milliseconds: 360),
      width: _folded ? 58 : MediaQuery.of(context).size.width,
      height: 56,
      decoration: BoxDecoration(
        color: MainTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: MainTheme.secondary,
        ),
        boxShadow: _folded ? [] : [AppThemeProperties.shadow],
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 360),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.search_rounded,
                    color: MainTheme.accent,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: _folded ? null : const NotesSearchBar(),
            ),
          ),
          // AnimatedContainer(
          //   duration: Duration(seconds: 5),
          //   child: Material(
          //     type: MaterialType.transparency,
          //     child: InkWell(
          //       onTap: () {
          //         setState(() {
          //           _folded = !_folded;
          //         });
          //       },
          //       child: Icon(
          //         Icons.search_rounded,
          //         color: MainTheme.accent,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
