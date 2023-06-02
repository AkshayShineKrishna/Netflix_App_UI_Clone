import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix/Domain/hot_and_new/coming_soon_services.dart';
import 'package:netflix/Domain/hot_and_new/everyones_watching_services.dart';
import 'package:netflix/Domain/hot_and_new/model/everyones_watching/everyones_watching.dart';

import '../../Domain/core/failures/main_failure.dart';
import '../../Domain/hot_and_new/model/coming_soon/coming_soon.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final ComingSoonServices _comingSoonServices;
  final EveryonesWatchingServices _everyonesWatchingServices;
  HotAndNewBloc(this._comingSoonServices, this._everyonesWatchingServices)
      : super(HotAndNewState.initial()) {
    on<_getUpcoming>((event, emit) async {
      if (state.comingSoonList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        comingSoonList: [],
        isLoadingComingSoon: true,
        isErrorComingSoon: false,
      ));
      final result = await _comingSoonServices.getUpcoming();
      log(result.toString());
      result.fold((MainFailure failure) {
        emit(state.copyWith(
          comingSoonList: [],
          isLoadingComingSoon: false,
          isErrorComingSoon: true,
        ));
      }, (ComingSoon success) {
        emit(state.copyWith(
            comingSoonList: success.results,
            isLoadingComingSoon: false,
            isErrorComingSoon: false));
      });
    });
    on<_getPopular>((event, emit) async {
      if (state.popularList.isNotEmpty) {
        emit(state);
        return;
      }
      emit(state.copyWith(
        popularList: [],
        isLoadingPopular: true,
        isErrorPopular: false,
      ));
      final result = await _everyonesWatchingServices.getPopular();
      log(result.toString());
      result.fold((MainFailure failure) {
        emit(state.copyWith(
          popularList: [],
          isLoadingPopular: false,
          isErrorComingSoon: true,
        ));
      }, (success) {
        emit(state.copyWith(
            popularList: success.results,
            isLoadingPopular: false,
            isErrorPopular: false));
      });
    });
  }
}
