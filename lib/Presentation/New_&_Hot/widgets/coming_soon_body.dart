import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';

import '../../../Core/constants.dart';
import 'custom_icon_widget.dart';

class ComingSoonMovieWidget extends StatelessWidget {
  final String imageUrl;
  final String overview;
  final String logoUrl;
  final String month;
  final String day;
  const ComingSoonMovieWidget({
    super.key,
    required this.imageUrl,
    required this.overview,
    required this.logoUrl,
    required this.month,
    required this.day,
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
                VideoWidget(size: size, imageUrl: imageUrl),
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

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    super.key,
    required this.size,
    required this.imageUrl,
  });

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: size.width * 0.45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          right: 15,
          bottom: 15,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: kButtonBlack.withOpacity(0.8),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.volume_off,
                  color: kButtonWhite,
                )),
          ),
        ),
      ],
    );
  }
}

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

class MovieLogoAndIconsWidget extends StatelessWidget {
  final String logoUrl;
  const MovieLogoAndIconsWidget({
    super.key,
    required this.size,
    required this.logoUrl,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.45,
          height: size.width * 0.1,
          child: CachedNetworkImage(
            imageUrl: logoUrl,
            alignment: Alignment.centerLeft,
          ),
        ),
        const Spacer(),
        const CustomIconWidget(
          icon: Icons.notifications_none_rounded,
          title: 'Remind Me',
        ),
        kWidth,
        const CustomIconWidget(
          icon: Icons.info_outline_rounded,
          title: 'Info',
        ),
        kWidth
      ],
    );
  }
}
