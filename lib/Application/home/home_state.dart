part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isErrorMalayalam,
    required bool isLoadingMalayalam,
    required List<MalayalamMovieResponseData> malayalamList,
    required String? mainImgList,
    required List<AnimationResponseData> animationList,
    required List<ReleasedPastYearResult> releasedPastList,
    required List<TopRatedResult> topRatedList,
    required List<TopTvResultData> topTvResultList,
    required bool isLoadingTopRated,
    required bool isErrorTopRated,
    required bool isLoadingTopTv,
    required bool isErrorTopTv,
    required bool isErrorPastYear,
    required bool isLoadingPastYear,
    required bool isLoadingAnimData,
    required bool isErrorAnimData,
    required bool isLoadingImgList,
    required bool isErrorImgList,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        animationList: [],
        releasedPastList: [],
        isErrorPastYear: false,
        isLoadingPastYear: false,
        topRatedList: [],
        topTvResultList: [],
        isLoadingTopRated: false,
        isErrorTopRated: false,
        isLoadingTopTv: false,
        isErrorTopTv: false,
        isErrorAnimData: false,
        isLoadingAnimData: false,
        mainImgList: null,
        isErrorImgList: false,
        isLoadingImgList: false,
        isErrorMalayalam: false,
        isLoadingMalayalam: false,
        malayalamList: [],
      );
}
