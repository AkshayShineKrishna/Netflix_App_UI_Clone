import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Core/constants.dart';
import 'custom_icon_widget.dart';

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

class VideoWidget extends StatefulWidget {
  final String videoUrl;
  final String imageUrl;

  const VideoWidget({Key? key, required this.videoUrl, required this.imageUrl})
      : super(key: key);

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late YoutubePlayerController _controller;
  bool isVideoLoaded = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void loadVideo() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: true,
      ),
    );
    setState(() {
      isVideoLoaded = true;
    });
  }

  void toggleMute() {
    if (isMuted) {
      setState(() {
        isMuted = !isMuted;
        _controller.unMute();
      });
    } else {
      setState(() {
        isMuted = !isMuted;
        _controller.mute();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        if (!isVideoLoaded) {
          loadVideo();
        }
      },
      child: isVideoLoaded
          ? Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  width: double.infinity,
                  height: size.width * 0.45,
                  child: YoutubePlayer(
                    controller: _controller,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        colors: const ProgressBarColors(
                            playedColor: kRed,
                            handleColor: kRed,
                            backgroundColor: kGreyBackground),
                        isExpanded: true,
                      ),
                    ],
                    thumbnail: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: IconButton(
                        alignment: Alignment.center,
                        iconSize: 12,
                        color: Colors.white,
                        icon: Icon(isMuted
                            ? CupertinoIcons.volume_off
                            : CupertinoIcons.volume_up),
                        onPressed: toggleMute,
                      ),
                    ),
                  ),
                )
              ],
            )
          : Container(
              width: double.infinity,
              height: size.width * 0.45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.cover))),
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
