import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Core/strings.dart';
import '../../../Application/search/search_bloc.dart';
import '../../../Core/constants.dart';
import 'search_title.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTitleWidget(
          title: 'Movies & TV',
        ),
        kHeight,
        Expanded(child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            final filteredList = state.searchResultList
                .where((media) => media.posterPath != null)
                .toList();
            return GridView.count(
              childAspectRatio: 1.5 / 2.5,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: List.generate(filteredList.length, (index) {
                final media = filteredList[index];
                return MovieCard(
                  mediaUrl: '$imageAppendUrl${media.posterPath}',
                );
              }),
            );
          },
        ))
      ],
    );
  }
}

class MovieCard extends StatelessWidget {
  final String mediaUrl;
  const MovieCard({required this.mediaUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(mediaUrl), fit: BoxFit.cover)),
    );
  }
}
