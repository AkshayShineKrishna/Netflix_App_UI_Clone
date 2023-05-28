part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewEvent with _$HotAndNewEvent {
  const factory HotAndNewEvent.getUpcoming() = _getUpcoming;
  const factory HotAndNewEvent.getPopular() = _getPopular;
}
