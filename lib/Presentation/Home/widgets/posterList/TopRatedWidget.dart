import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Application/home/home_bloc.dart';
import '../../../../Core/strings.dart';
import '../../../widgets/movie_card_widget.dart';

class TopRatedWidgetPosters extends StatelessWidget {
  const TopRatedWidgetPosters({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingTopRated) {
          return const CircularProgressIndicator();
        } else if (state.isErrorTopRated) {
          return const Center(
            child: Text('Error Occured'),
          );
        } else if (state.topRatedList.isEmpty) {
          return const Center(
            child: Text('List is empty'),
          );
        }
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) {
            final movie = state.topRatedList[index];
            return MovieCardWidget(
              imageUrl: '$imageAppendUrl${movie.posterPath}',
            );
          }),
        );
      },
    );
  }
}
