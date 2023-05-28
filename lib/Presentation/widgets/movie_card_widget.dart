import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5),
      child: Container(
        height: size.width * 0.5,
        width: size.width * 0.38,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover)),
      ),
    );
  }
}
