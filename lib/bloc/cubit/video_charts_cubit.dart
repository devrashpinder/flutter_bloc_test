import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_test_nextbase/core/network/result_error.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/respository/video_meta_repo.dart';

import '../page_cubit_states.dart';

class VideoChartsCubit extends Cubit<PageCubitState> {
  final VideoMetaDataRepository videoRepo;
  VideoMetaDataModel? videoMetaModel;
  VideoChartsCubit(this.videoRepo) : super(PageCubitInitialState());

  Future fetchVideoMetaData() async {
    final videoData = await videoRepo.getVideoMetaDataModel();
    if (videoData.data!.isNotEmpty) {
      videoMetaModel = videoData;
      emit(PageCubitSuccessState(videoData.data!));
    } else {
      emit(PageCubitFailureState(ResultError.emptyContent()));
    }
  }
}
