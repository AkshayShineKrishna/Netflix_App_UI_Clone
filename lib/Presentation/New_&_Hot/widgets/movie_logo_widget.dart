import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../Core/constants.dart';
import 'custom_icon_widget.dart';

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
