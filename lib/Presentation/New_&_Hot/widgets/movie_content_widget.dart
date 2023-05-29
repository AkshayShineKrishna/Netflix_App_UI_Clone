import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';

import '../../../Core/constants.dart';

class MovieContentWidget extends StatelessWidget {
  final String overview;
  final String month;
  final String day;
  const MovieContentWidget({
    super.key,
    required this.overview,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Coming on $month $day',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5),
        ),
        kHeight,
        Text(
          overview,
          textAlign: TextAlign.left,
          maxLines: 3,
          style: const TextStyle(color: kGreyFont, fontSize: 12.5),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
