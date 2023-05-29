import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';

import '../../../Core/constants.dart';

class MovieDateWidget extends StatelessWidget {
  final String month;
  final String day;
  const MovieDateWidget({
    super.key,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          month,
          style: const TextStyle(fontWeight: FontWeight.bold, color: kGreyFont),
        ),
        Text(day,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 40, letterSpacing: 5))
      ],
    );
  }
}
