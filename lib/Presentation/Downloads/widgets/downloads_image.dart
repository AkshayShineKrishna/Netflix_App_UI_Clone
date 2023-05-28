import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.size,
      required this.images,
      this.rotation = 0,
      required this.margin})
      : super(key: key);

  final Size size;
  final String images;
  final double rotation;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: rotation * pi / 180,
        child: Container(
          margin: margin,
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 50),
                imageUrl: images,
                fit: BoxFit.cover,
              )),
        ));
  }
}
