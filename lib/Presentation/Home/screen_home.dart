import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Presentation/Home/widgets/main_movie_card_widget.dart';
import 'package:netflix/Presentation/Home/widgets/posterList/PastYearWidget.dart';
import 'package:netflix/Presentation/Home/widgets/posterList/TopRatedWidget.dart';
import 'package:netflix/Presentation/Home/widgets/posterList/animation_widget.dart';
import 'package:netflix/Presentation/Home/widgets/posterList/malayalam_posters_widget.dart';

import '../../Application/home/home_bloc.dart';
import 'widgets/background_card.dart';
import 'widgets/main_number_card_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.getMainImage());
      BlocProvider.of<HomeBloc>(context).add(const HomeEvent.getTopTv());
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getTopRatedMovies());
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getReleasedPastYear());
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getAnimationData());
      BlocProvider.of<HomeBloc>(context)
          .add(const HomeEvent.getMalayalamMovies());
    });
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (context, value, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              const SingleChildScrollView(
                child: Column(
                  children: [
                    MainImageWidget(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          MainMovieCardWidget(
                            title: 'Released in the past year',
                            posterType: ReleasedPastWidgetPosters(),
                          ),
                          kHeight,
                          MainMovieCardWidget(
                            title: 'Top rated movies',
                            posterType: TopRatedWidgetPosters(),
                          ),
                          kHeight,
                          MainNumberCardWidget(),
                          kHeight,
                          MainMovieCardWidget(
                            title: 'Best Animation works',
                            posterType: AnimationPosterWidget(),
                          ),
                          kHeight,
                          MainMovieCardWidget(
                            title: 'Malayalam Movies',
                            posterType: MalayalamMoviePostersWidget(),
                          ),
                          kHeight,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              scrollNotifier.value == true
                  ? CustomAppBarWidget(size: size)
                  : kWidth,
            ],
          ),
        );
      },
    ));
  }
}

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      child: Container(
        color: Colors.black.withOpacity(0.5),
        height: size.height * 0.13,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/netflix_logo.png',
                    scale: 7,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cast,
                          size: 30,
                        ),
                      ),
                      kWidth,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          color: Colors.blue,
                          height: 27,
                          width: 27,
                        ),
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              kHeight,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'TV Shows',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Movies',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
