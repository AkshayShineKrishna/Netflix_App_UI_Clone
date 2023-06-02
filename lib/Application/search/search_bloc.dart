import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/Downloads/i_downloads_repo.dart';
import 'package:netflix/Domain/Downloads/models/downloads.dart';
import 'package:netflix/Domain/core/failures/main_failure.dart';
import 'package:netflix/Domain/search/model/search_response.dart';
import 'package:netflix/Domain/search/search_services.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsServices;
  final SearchServices _searchServices;
  SearchBloc(
    this._downloadsServices,
    this._searchServices,
  ) : super(SearchState.initial()) {
    /*
    Idle State
    */
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(state.copyWith(searchResultList: []));
        return;
      }
      //get trending
      emit(const SearchState(
        searchResultList: [],
        idleList: [],
        isLoading: true,
        isError: false,
      ));
      final result = await _downloadsServices.getDownloadsImages();
      log(result.toString());
      result.fold((MainFailure failure) {
        emit(const SearchState(
            searchResultList: [],
            idleList: [],
            isLoading: false,
            isError: true));
      }, (List<Downloads> success) {
        emit(SearchState(
            searchResultList: [],
            idleList: success,
            isLoading: false,
            isError: false));
      });
      //show to UI
    });

    /*
    Search query respose state
    */
    on<SearchMedia>((event, emit) async {
      // if (event.mediaQuery.isEmpty) {
      //   emit(SearchState(
      //     searchResultList: [],
      //     idleList: state.idleList,
      //     isLoading: false,
      //     isError: false,
      //   ));
      //   return;
      // }
      log('searching for ${event.mediaQuery}');
      emit(SearchState(
        searchResultList: [],
        idleList: state.idleList,
        isLoading: true,
        isError: false,
      ));
      //get search result
      final result =
          await _searchServices.searchMedia(mediaQuery: event.mediaQuery);
      result.fold((MainFailure failure) {
        emit(SearchState(
            searchResultList: [],
            idleList: state.idleList,
            isLoading: false,
            isError: true));
      }, (SearchResponse success) {
        emit(SearchState(
            searchResultList: success.results,
            idleList: state.idleList,
            isLoading: false,
            isError: false));
      });
      //show to UI
    });
  }
}
