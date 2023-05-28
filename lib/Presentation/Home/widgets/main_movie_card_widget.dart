import 'package:flutter/material.dart';
import '../../../Core/constants.dart';
import '../../widgets/main_title_card.dart';

class MainMovieCardWidget extends StatelessWidget {
  const MainMovieCardWidget(
      {super.key, required this.title, required this.posterType});

  final String title;
  final Widget posterType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleCard(title: title),
        kHeight,
        LimitedBox(
          maxHeight: size.width * 0.5,
          child: posterType,
        )
      ],
    );
  }
}
