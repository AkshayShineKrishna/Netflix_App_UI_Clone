import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/Home/animation_response_services.dart';
import 'package:netflix/Domain/Home/malayalam_movie_response_services.dart';
import 'package:netflix/Domain/Home/model/animation_response/animation_response.dart';
import 'package:netflix/Domain/Home/model/malayalam_movie_response/malayalam_movie_response.dart';
import 'package:netflix/Domain/Home/model/release_past_year/released_past_year.dart';
import 'package:netflix/Domain/Home/model/top_rated_movies/top_rated_movies.dart';
import 'package:netflix/Domain/Home/top_rated_services.dart';

import '../../Domain/Downloads/i_downloads_repo.dart';
import '../../Domain/Home/model/top_tv_shows.dart';
import '../../Domain/Home/released_past_year_services.dart';
import '../../Domain/Home/top_tv_show_services.dart';
import '../../Domain/core/failures/main_failure.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IDownloadsRepo _iDownloadsRepo;
  final TopTvShowsServices _topTvShowsServices;
  final TopRatedServices _topRatedServices;
  final ReleasedPastYearServices _releasedPastYearServices;
  final AnimationResponseServices _animationResponseServices;
  final MalayalamMovieService _malayalamMovieService;
  HomeBloc(
      this._topTvShowsServices,
      this._topRatedServices,
      this._releasedPastYearServices,
      this._animationResponseServices,
      this._iDownloadsRepo,
      this._malayalamMovieService)
      : super(HomeState.initial()) {
    on<_getTopTv>((event, emit) async {
      if (state.topTvResultList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        topTvResultList: [],
        isLoadingTopTv: true,
        isErrorTopTv: false,
      ));
      final result = await _topTvShowsServices.getTopTV();
      log(result.toString());
      result.fold((MainFailure failure) {
        emit(state.copyWith(
          topTvResultList: [],
          isLoadingTopTv: false,
          isErrorTopTv: true,
        ));
      }, (TopTvShows success) {
        emit(state.copyWith(
            topTvResultList: success.results,
            isLoadingTopTv: false,
            isErrorTopTv: false));
      });
    });
    on<_getTopRatedMovies>((event, emit) async {
      if (state.topRatedList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
          isErrorTopRated: false, isLoadingTopRated: true, topRatedList: []));
      final result = await _topRatedServices.getTopRatedMovies();
      log(result.toString());
      result.fold((failure) {
        emit(state.copyWith(
          topRatedList: [],
          isLoadingTopRated: false,
          isErrorTopRated: true,
        ));
      }, (success) {
        emit(state.copyWith(
            topRatedList: success.results,
            isLoadingTopRated: false,
            isErrorTopRated: false));
      });
    });
    on<_getReleasedPastYear>((event, emit) async {
      if (state.releasedPastList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
          isLoadingPastYear: true,
          isErrorPastYear: false,
          releasedPastList: []));
      final result = await _releasedPastYearServices.getReleasedPastYear();
      log(result.toString());
      result.fold((failure) {
        emit(state.copyWith(
            isLoadingPastYear: false,
            isErrorPastYear: true,
            releasedPastList: []));
      }, (success) {
        final movieList = success.results;
        movieList.shuffle();
        emit(state.copyWith(
            isLoadingPastYear: false,
            isErrorPastYear: false,
            releasedPastList: movieList));
      });
    });
    on<_getAnimationData>((event, emit) async {
      if (state.animationList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
          isLoadingAnimData: true, isErrorAnimData: false, animationList: []));
      final result = await _animationResponseServices.getAnimationData();
      log(result.toString());
      result.fold((failure) {
        emit(state.copyWith(
            isLoadingAnimData: false,
            isErrorAnimData: true,
            releasedPastList: []));
      }, (success) {
        final movieList = success.results;
        movieList.shuffle();
        emit(state.copyWith(
            isLoadingAnimData: false,
            isErrorAnimData: false,
            animationList: movieList));
      });
    });
    on<_getMainImage>((event, emit) async {
      if (state.mainImgList != null) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        mainImgList: null,
        isErrorImgList: false,
        isLoadingImgList: true,
      ));
      final result = await _iDownloadsRepo.getDownloadsImages();
      result.fold((failure) {
        emit(state.copyWith(
          mainImgList: null,
          isErrorImgList: true,
          isLoadingImgList: false,
        ));
      }, (success) {
        final movieList = success;
        movieList.shuffle();
        final movie = movieList[0].posterPath;
        emit(state.copyWith(
          mainImgList: movie,
          isErrorImgList: false,
          isLoadingImgList: false,
        ));
      });
    });
    on<_getMalayalamMovies>((event, emit) async {
      if (state.malayalamList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        malayalamList: [],
        isErrorMalayalam: false,
        isLoadingMalayalam: true,
      ));
      final result = await _malayalamMovieService.getMalayalamMovies();
      result.fold((failure) {
        emit(state.copyWith(
          malayalamList: [],
          isErrorMalayalam: true,
          isLoadingImgList: false,
        ));
      }, (success) {
        final movieList = success.results;
        movieList.shuffle();
        emit(state.copyWith(
          malayalamList: movieList,
          isErrorMalayalam: false,
          isLoadingMalayalam: false,
        ));
      });
    });
  }
}
