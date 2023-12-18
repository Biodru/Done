import 'package:done/config/theme/main_theme.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    Key? key,
    required this.counter,
    required this.icon,
    required this.buttonTitle,
    required this.sortAction,
  }) : super(key: key);

  final int counter;
  final IconData icon;
  final String buttonTitle;
  final VoidCallback sortAction;

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  double _turns = 0;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        widget.sortAction();
        if (widget.counter >= 1) {
          setState(() => _turns += 0.5);
        }
      },
      icon: Icon(
        widget.icon,
        color: MainTheme.secondary,
      ),
      label: Row(
        children: [
          Text(
            widget.buttonTitle,
            style: const TextStyle(color: MainTheme.secondary),
          ),
          widget.counter != 0
              ? AnimatedRotation(
                  duration: const Duration(milliseconds: 360),
                  turns: _turns,
                  child: const Icon(
                    Icons.arrow_upward,
                    color: MainTheme.secondary,
                  ),
                )
              : const SizedBox(),
        ],
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: MainTheme.backgroundColor,
        foregroundColor: MainTheme.secondary,
        side: const BorderSide(color: MainTheme.secondary),
      ),
    );
  }
}
