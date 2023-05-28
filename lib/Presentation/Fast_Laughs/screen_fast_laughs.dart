import 'package:flutter/material.dart';
import 'package:netflix/Presentation/Fast_Laughs/widgets/video_list.dart';

class ScreenFastLaughs extends StatelessWidget {
  const ScreenFastLaughs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(20, (index) => VideoListItem(index: index)),
      )),
    );
  }
}
