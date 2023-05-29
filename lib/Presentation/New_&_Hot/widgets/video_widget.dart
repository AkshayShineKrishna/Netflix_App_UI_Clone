import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
        autoPlay: true,
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
          : GestureDetector(
              onTap: () {
                if (!isVideoLoaded) {
                  loadVideo();
                }
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      width: double.infinity,
                      height: size.width * 0.45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              fit: BoxFit.cover))),
                  const Icon(
                    Icons.play_arrow_rounded,
                    size: 50,
                  )
                ],
              ),
            ),
    );
  }
}
