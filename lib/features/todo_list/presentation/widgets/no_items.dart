import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(
            Icons.list,
            color: Color(0xffFFD966),
          ),
          Text(errorMessage),
        ],
      ),
    );
  }
}
