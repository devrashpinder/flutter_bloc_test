import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test_nextbase/core/network/result_error.dart';

import '../page_states/page_cubit_states.dart';

class VideoMapPathCubit extends Cubit<PageCubitState> {
  List<LatLng> latLngs;
  VideoMapPathCubit(this.latLngs) : super(PageCubitInitialState());

  Future loadData() async {
    if (latLngs.isNotEmpty) {
      emit(PageCubitSuccessState(latLngs));
    } else {
      emit(PageCubitFailureState(ResultError.emptyContent()));
    }
  }
}
