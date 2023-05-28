import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/downloads/downloads_bloc.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/Constants.dart';
import 'package:netflix/Core/strings.dart';
import 'package:netflix/Presentation/Downloads/widgets/downloads_image.dart';

import '../widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetsList = [
    const _SmartDownloads(),
    const _Section2(),
    const _Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            title: 'Downloads',
          ),
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(10.0),
          itemBuilder: (ctx, index) => _widgetsList[index],
          separatorBuilder: (ctx, index) => kHeightLarge,
          itemCount: _widgetsList.length,
        ),
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        const Text(
          'Smart Downloads',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: kWhiteFont,
          ),
        ),
      ],
    );
  }
}

class _Section2 extends StatelessWidget {
  const _Section2();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(const DownloadsEvent.getDownloadsImage());
    });
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We'll download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice.",
          textAlign: TextAlign.center,
          style: TextStyle(color: kGreyFont, fontSize: 16.5),
        ),
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            return SizedBox(
              height: size.width,
              width: size.width,
              child: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: kGreyBackground.withOpacity(0.4),
                          radius: size.width * 0.35,
                        ),
                        DownloadsImageWidget(
                          size: Size(size.width * 0.35, size.width * 0.47),
                          images:
                              '$imageAppendUrl${state.downloads![0].posterPath}',
                          margin: const EdgeInsets.only(left: 155, bottom: 30),
                          rotation: 18,
                        ),
                        DownloadsImageWidget(
                          size: Size(size.width * 0.35, size.width * 0.47),
                          images:
                              '$imageAppendUrl${state.downloads![1].posterPath}',
                          margin: const EdgeInsets.only(right: 155, bottom: 30),
                          rotation: -18,
                        ),
                        DownloadsImageWidget(
                            size: Size(size.width * 0.4, size.width * 0.57),
                            images:
                                '$imageAppendUrl${state.downloads![2].posterPath}',
                            margin: const EdgeInsets.all(0)),
                      ],
                    ),
            );
          },
        ),
      ],
    );
  }
}

class _Section3 extends StatelessWidget {
  const _Section3();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              height: 48,
              onPressed: () {},
              color: kButtonBlue,
              child: const Text(
                'Set Up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kWhiteFont,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        kHeight,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            height: 45,
            width: double.infinity,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              onPressed: () {},
              color: kButtonWhite,
              child: const Text(
                'See what you can Download',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kBlackFont,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
