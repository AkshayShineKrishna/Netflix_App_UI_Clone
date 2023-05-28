import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/strings.dart';

import '../../../Application/home/home_bloc.dart';

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingImgList) {
          return const CircularProgressIndicator();
        } else if (state.isErrorImgList) {
          return const Center(
            child: Text('Error Occured'),
          );
        } else if (state.mainImgList == null) {
          return const Center(
            child: Text('List is empty'),
          );
        }
        final movie = state.mainImgList;
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: size.height * 0.65,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('$imageAppendUrl$movie')),
              ),
            ),
            Container(
              width: size.width,
              height: 200,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black])),
            ),
            Positioned(
              bottom: 10,
              child: SizedBox(
                width: size.width,
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _CustomIconWidget(
                      icon: Icons.add,
                      title: 'My List',
                    ),
                    _PlayButton(),
                    _CustomIconWidget(
                      icon: Icons.info_outline_rounded,
                      title: 'Info',
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CustomIconWidget extends StatelessWidget {
  const _CustomIconWidget({
    required this.title,
    required this.icon,
  });

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: kButtonBlack,
      ),
      label: const Text(
        'Play',
        style: TextStyle(color: kBlackFont, fontWeight: FontWeight.bold),
      ),
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kButtonWhite)),
    );
  }
}
