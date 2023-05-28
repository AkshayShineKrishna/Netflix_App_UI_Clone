import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Core/strings.dart';
import '../../../Application/search/search_bloc.dart';
import 'search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                );
              } else if (state.isError) {
                return const Center(
                  child: Text('Error occured'),
                );
              } else if (state.idleList.isEmpty) {
                return const Center(
                  child: Text('Idle list empty'),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final media = state.idleList[index];
                  return TopSearchItemTile(
                      imageUrl: media.backdropPath!,
                      title: media.title ?? media.name);
                },
                separatorBuilder: (context, index) => kHeightMedium,
                itemCount: state.idleList.length,
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String imageUrl;
  final String? title;
  const TopSearchItemTile(
      {required this.imageUrl, required this.title, Key? key})
      : super(key: key);

  // final image =
  //     'https://www.themoviedb.org/t/p/w250_and_h141_face/8rpDcsfLJypbO6vREc0547VKqEv.jpg';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.33,
          height: size.width * 0.20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                image: NetworkImage('$imageAppendUrl$imageUrl'),
                fit: BoxFit.cover,
              )),
        ),
        kWidth,
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: Text(
                title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.play_circle,
                    color: kButtonWhite,
                    size: 35,
                  ))
            ],
          ),
        )
      ],
    );
  }
}
