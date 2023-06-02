import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/constants.dart';

class VideoListItem extends StatelessWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //left
                CircleAvatar(
                  radius: 30,
                  backgroundColor: kButtonBlack.withOpacity(0.5),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.volume_off,
                        color: kButtonWhite,
                      )),
                ),

                //right
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 25,
                    ),
                    kHeight,
                    VideoListActionsWidget(
                        icon: Icons.emoji_emotions_rounded, title: 'LOL'),
                    VideoListActionsWidget(icon: Icons.add, title: 'My list'),
                    VideoListActionsWidget(
                        icon: CupertinoIcons.paperplane, title: 'Share'),
                    VideoListActionsWidget(
                        icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class VideoListActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoListActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
