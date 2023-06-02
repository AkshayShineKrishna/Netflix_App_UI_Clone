import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/Application/search/search_bloc.dart';
import 'package:netflix/Core/Colors/colors.dart';
import 'package:netflix/Core/constants.dart';
import 'package:netflix/Domain/core/debounce/debounce.dart';
import 'package:netflix/Presentation/search/widgets/search_idle.dart';

import 'widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 1 * 1000);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CupertinoSearchTextField(
            padding: const EdgeInsets.all(10.0),
            prefixIcon: const Icon(
              CupertinoIcons.search,
              color: kGreyIcon,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: kGreyIcon,
            ),
            style: const TextStyle(color: kWhiteFont),
            backgroundColor: kGreyBackground.withOpacity(0.3),
            onChanged: (value) {
              if (value.isEmpty) {
                BlocProvider.of<SearchBloc>(context).add(const Initialize());
                return;
              }
              debouncer.run(() {
                BlocProvider.of<SearchBloc>(context)
                    .add(SearchMedia(mediaQuery: value));
              });
            },
          ),
          kHeight,
          Expanded(child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.searchResultList.isEmpty) {
                return const SearchIdleWidget();
              } else {
                return const SearchResultWidget();
              }
            },
          ))
        ],
      ),
    )));
  }
}
