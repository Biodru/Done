import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.list,
            color: Theme.of(context).colorScheme.onErrorContainer,
          ),
          Text(errorMessage),
        ],
      ),
    );
  }
}
