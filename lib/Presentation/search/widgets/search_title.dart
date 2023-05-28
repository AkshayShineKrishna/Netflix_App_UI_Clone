import 'package:flutter/material.dart';

class SearchTitleWidget extends StatelessWidget {
  const SearchTitleWidget({
    required this.title,
    super.key,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
