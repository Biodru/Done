import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Icon(
            Icons.list,
            color: Color(0xffFFD966),
          ),
          Text('Nie masz zadań na liście'),
        ],
      ),
    );
  }
}
