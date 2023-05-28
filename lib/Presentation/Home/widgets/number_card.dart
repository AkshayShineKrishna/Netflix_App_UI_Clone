import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/strings.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget(
      {required this.index, required this.imageUrl, super.key});
  final String index;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.5),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(
                height: 40,
                width: 60,
              ),
              Container(
                height: size.width * 0.5,
                width: size.width * 0.38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: NetworkImage('$imageAppendUrl$imageUrl'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
          Positioned(
              left: 35,
              top: 115,
              child: Center(
                child: BorderedText(
                  strokeColor: kWhiteFont,
                  child: Text(
                    index,
                    style: const TextStyle(
                        fontSize: 95,
                        fontWeight: FontWeight.bold,
                        color: kBlackFont),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
