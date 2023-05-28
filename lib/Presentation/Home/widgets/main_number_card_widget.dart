import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Application/home/home_bloc.dart';
import '../../../Core/constants.dart';
import '../../widgets/main_title_card.dart';
import 'number_card.dart';

class MainNumberCardWidget extends StatelessWidget {
  const MainNumberCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitleCard(title: 'Top 10 TV shows Globally 🌏'),
        kHeight,
        LimitedBox(
            maxHeight: size.width * 0.5,
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isLoadingTopTv) {
                  return const CircularProgressIndicator();
                } else if (state.isErrorTopTv) {
                  return const Center(
                    child: Text('Error occured'),
                  );
                } else if (state.topTvResultList.isEmpty) {
                  return const Center(
                    child: Text('List is empty'),
                  );
                }
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(10, (index) {
                    final tvshow = state.topTvResultList[index];
                    return NumberCardWidget(
                      index: (index + 1).toString(),
                      imageUrl: tvshow.posterPath!,
                    );
                  }),
                );
              },
            )),
      ],
    );
  }
}
