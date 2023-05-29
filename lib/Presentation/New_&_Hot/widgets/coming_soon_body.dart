import 'package:flutter/material.dart';
import 'package:netflix/Presentation/New_&_Hot/widgets/video_widget.dart';

import '../../../Core/constants.dart';
import 'movie_content_widget.dart';
import 'movie_date_widget.dart';
import 'movie_logo_widget.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  final String videoUrl;
  const ComingSoonMovieWidget({
    super.key,
    required this.imageUrl,
    required this.overview,
    required this.logoUrl,
    required this.month,
    required this.day,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.85,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            MovieDateWidget(
              month: month,
              day: day,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, left: 4, right: 4),
                  child: VideoWidget(
                    imageUrl: imageUrl,
                    videoUrl: videoUrl,
                  ),
                ),
                MovieLogoAndIconsWidget(
                  size: size,
                  logoUrl: logoUrl,
                ),
                kHeightLarge,
                MovieContentWidget(
                  month: month,
                  day: day,
                  overview: overview,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
