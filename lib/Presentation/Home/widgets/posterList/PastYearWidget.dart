import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Application/home/home_bloc.dart';
import '../../../../Core/strings.dart';
import '../../../widgets/movie_card_widget.dart';

class ReleasedPastWidgetPosters extends StatelessWidget {
  const ReleasedPastWidgetPosters({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingPastYear) {
          return const CircularProgressIndicator();
        } else if (state.isErrorPastYear) {
          return const Center(
            child: Text('Error Occured'),
          );
        } else if (state.releasedPastList.isEmpty) {
          return const Center(
            child: Text('List is empty'),
          );
        }
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) {
            final movie = state.releasedPastList[index];
            return MovieCardWidget(
              imageUrl: '$imageAppendUrl${movie.posterPath}',
            );
          }),
        );
      },
    );
  }
}
