part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.getTopTv() = _getTopTv;
  const factory HomeEvent.getTopRatedMovies() = _getTopRatedMovies;
  const factory HomeEvent.getReleasedPastYear() = _getReleasedPastYear;
  const factory HomeEvent.getAnimationData() = _getAnimationData;
  const factory HomeEvent.getMainImage() = _getMainImage;
  const factory HomeEvent.getMalayalamMovies() = _getMalayalamMovies;
}
