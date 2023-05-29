import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Presentation/New_&_Hot/widgets/video_widget.dart';

import '../../../Core/constants.dart';
import 'custom_icon_widget.dart';

class EveronesWtchingBodyWidget extends StatelessWidget {
  final String overview;
  final String logoUrl;
  final String imageUrl;
  final String videoUrl;
  const EveronesWtchingBodyWidget({
    super.key,
    required this.size,
    required this.overview,
    required this.logoUrl,
    required this.imageUrl,
    required this.videoUrl,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: VideoWidget(
              imageUrl: imageUrl,
              videoUrl: videoUrl,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kWidth,
              SizedBox(
                width: size.width * 0.23,
                height: size.width * 0.1,
                child: CachedNetworkImage(
                  imageUrl: logoUrl,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                ),
              ),
              const Spacer(),
              const CustomIconWidget(
                icon: Icons.share,
                title: 'Share',
              ),
              kWidth,
              const CustomIconWidget(
                icon: Icons.add,
                title: 'My List',
              ),
              kWidth,
              const CustomIconWidget(
                icon: Icons.play_arrow_rounded,
                title: 'Play',
              ),
              kWidth
            ],
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              overview,
              textAlign: TextAlign.left,
              style: const TextStyle(color: kGreyFont, fontSize: 12.5),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
