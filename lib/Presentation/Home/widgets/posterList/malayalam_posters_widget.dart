import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Application/home/home_bloc.dart';
import '../../../../Core/strings.dart';
import '../../../widgets/movie_card_widget.dart';

class MalayalamMoviePostersWidget extends StatelessWidget {
  const MalayalamMoviePostersWidget({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoadingMalayalam) {
          return const CircularProgressIndicator();
        } else if (state.isErrorMalayalam) {
          return const Center(
            child: Text('Error Occured'),
          );
        } else if (state.malayalamList.isEmpty) {
          return const Center(
            child: Text('List is empty'),
          );
        }
        return ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(10, (index) {
            final movie = state.malayalamList[index];
            return MovieCardWidget(
              imageUrl: '$imageAppendUrl${movie.posterPath}',
            );
          }),
        );
      },
    );
  }
}