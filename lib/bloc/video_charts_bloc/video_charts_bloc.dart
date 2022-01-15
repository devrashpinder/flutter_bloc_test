import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test_nextbase/bloc/events/page_events.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/core/network/result_error.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/respository/video_meta_repo.dart';

class VideoChartsBloc extends Bloc<PageEvents, PageCubitState> {
  final VideoMetaDataRepository videoRepo;
  VideoMetaDataModel? videoMetaModel;
  VideoChartsBloc(this.videoRepo) : super(PageCubitInitialState()) {
    on<PageLoadingEvents>(_fetch);
  }
  void _fetch(PageLoadingEvents event, Emitter<PageCubitState> emit) async {
    final videoData = await videoRepo.getVideoMetaDataModel();
    if (videoData.data!.isNotEmpty) {
      videoMetaModel = videoData;
      emit(PageCubitSuccessState(videoData.data!));
    } else {
      emit(PageCubitFailureState(ResultError.emptyContent()));
    }
  }
}
