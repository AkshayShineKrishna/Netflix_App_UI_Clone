part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required List<ComingSoonData> comingSoonList,
    required List<EveryonesWatchingData> popularList,
    required bool isLoadingComingSoon,
    required bool isErrorComingSoon,
    required bool isLoadingPopular,
    required bool isErrorPopular,
  }) = _HotAndNewState;

  factory HotAndNewState.initial() => const HotAndNewState(
        comingSoonList: [],
        isLoadingComingSoon: false,
        isErrorComingSoon: false,
        isErrorPopular: false,
        isLoadingPopular: false,
        popularList: [],
      );
}
