import 'package:flutter_bloc_test_nextbase/core/network/network_result.dart';
import 'package:flutter_bloc_test_nextbase/core/services/sample_data.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';

class VideoMetaDataRepository {
  MobileService remoteService = MobileService();

  VideoMetaDataRepository();

  Future<VideoMetaDataModel> getVideoMetaDataModel() async {
    int page = -1;
    VideoMetaDataModel videoMetaModel = VideoMetaDataModel();
    videoMetaModel.hasMore = true;
    videoMetaModel.data = [];
    while (videoMetaModel.hasMore!) {
      page += 1;
      final videoMetaData = await _fetchVideoMetaData(page);
      if (videoMetaData != null && videoMetaData.data != null) {
        videoMetaModel.data!.addAll(videoMetaData.data!);
        videoMetaModel.hasMore = videoMetaData.hasMore ?? false;
      } else {
        videoMetaModel.hasMore = false;
      }
    }
    return videoMetaModel;
  }

  Future<VideoMetaDataModel?> _fetchVideoMetaData(int page) async {
    final result = await remoteService.getSampleVideoData(page);
    switch (result.status) {
      case ResultStatus.success:
        {
          var videoMetaData = VideoMetaDataModel.fromJson(result.value);
          if (videoMetaData.data?.isNotEmpty ?? false) {
            return videoMetaData;
          }
        }
        break;
      case ResultStatus.error:
        {
          return null;
        }
    }
    return null;
  }
}
