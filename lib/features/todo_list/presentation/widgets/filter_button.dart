import 'package:done/config/theme/main_theme.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final int counter;
  final IconData icon;
  final String buttonTitle;
  final VoidCallback sortAction;

  const FilterButton({
    Key? key,
    required this.counter,
    required this.icon,
    required this.buttonTitle,
    required this.sortAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        sortAction();
      },
      icon: Icon(
        icon,
        color: MainTheme.secondary,
      ),
      label: Row(
        children: [
          Text(
            buttonTitle,
            style: const TextStyle(color: MainTheme.secondary),
          ),
          counter != 0
              ? (counter == 1
                  ? const Icon(
                      Icons.arrow_upward,
                      color: MainTheme.secondary,
                    )
                  : counter == 2
                      ? const Icon(
                          Icons.arrow_downward,
                          color: MainTheme.secondary,
                        )
                      : const SizedBox())
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
