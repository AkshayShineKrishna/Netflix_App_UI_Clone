import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/strings.dart';

import '../../Core/constants.dart';
import 'widgets/coming_soon_body.dart';
import 'widgets/custom_icon_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const HotAndNewEvent.getUpcoming());
      BlocProvider.of<HotAndNewBloc>(context)
          .add(const HotAndNewEvent.getPopular());
    });
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                backgroundColor: kBackgroundColor,
                title: Text(
                  'New & Hot',
                  style: GoogleFonts.montserrat(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                actions: [
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
                  )
                ],
                bottom: TabBar(
                    isScrollable: false,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kWhiteBackground,
                    ),
                    labelColor: kBlackFont,
                    labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    unselectedLabelColor: kWhiteFont,
                    tabs: const [
                      Tab(
                        text: '🍿 Coming Soon',
                      ),
                      Tab(
                        text: "🔥 Everyone's watching",
                      ),
                    ]),
              ),
            ),
            body: const TabBarView(children: [
              ComingSoonListViewWidget(),
              EveryOnesWatchingTabWidget(),
            ])),
      ),
    );
  }
}

class ComingSoonListViewWidget extends StatelessWidget {
  const ComingSoonListViewWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoadingComingSoon) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (state.isErrorComingSoon) {
          return const Center(
            child: Text('Error occurred'),
          );
        } else if (state.comingSoonList.isEmpty) {
          return const Center(
            child: Text('Idle list empty'),
          );
        }
        final filteredList = state.comingSoonList
            .where((movie) => movie.logoPath != 'null')
            .toList();
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final movie = filteredList[index];
              return ComingSoonMovieWidget(
                videoUrl: movie.key!,
                imageUrl: '$imageAppendUrl${movie.backdropPath}',
                overview: movie.overview ?? 'overview not available',
                logoUrl: '$logoAppendUrl${movie.logoPath}',
                month: movie.month ?? 'Coming',
                day: movie.day ?? 'Soon',
              );
            },
            separatorBuilder: (ctx, index) => kHeight,
            itemCount: filteredList.length);
      },
    );
  }
}

class EveryOnesWatchingTabWidget extends StatelessWidget {
  const EveryOnesWatchingTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        if (state.isLoadingPopular) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (state.isErrorPopular) {
          return const Center(
            child: Text('Error occured'),
          );
        } else if (state.popularList.isEmpty) {
          return const Center(
            child: Text('Idle list empty'),
          );
        }
        final filteredList = state.popularList
            .where((movie) => movie.logoPath != 'null')
            .toList();
        return ListView.separated(
            itemBuilder: (ctx, index) {
              final movie = filteredList[index];
              return EveronesWtchingBodyWidget(
                videoUrl: movie.key!,
                size: size,
                imageUrl: '$imageAppendUrl${movie.backdropPath}',
                logoUrl: '$logoAppendUrl${movie.logoPath}',
                overview: movie.overview ?? 'no overview',
              );
            },
            separatorBuilder: (ctx, index) => kHeight,
            itemCount: filteredList.length);
      },
    );
  }
}

class EveronesWtchingBodyWidget extends StatelessWidget {
  final String overview;
  final String logoUrl;
  final String imageUrl;
  final String videoUrl;
  const EveronesWtchingBodyWidget({
    super.key,
    required this.size,
    required this.overview,
    required this.logoUrl,
    required this.imageUrl,
    required this.videoUrl,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: VideoWidget(
              imageUrl: imageUrl,
              videoUrl: videoUrl,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              kWidth,
              SizedBox(
                width: size.width * 0.23,
                height: size.width * 0.1,
                child: CachedNetworkImage(
                  imageUrl: logoUrl,
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                ),
              ),
              const Spacer(),
              const CustomIconWidget(
                icon: Icons.share,
                title: 'Share',
              ),
              kWidth,
              const CustomIconWidget(
                icon: Icons.add,
                title: 'My List',
              ),
              kWidth,
              const CustomIconWidget(
                icon: Icons.play_arrow_rounded,
                title: 'Play',
              ),
              kWidth
            ],
          ),
          kHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              overview,
              textAlign: TextAlign.left,
              style: const TextStyle(color: kGreyFont, fontSize: 12.5),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
