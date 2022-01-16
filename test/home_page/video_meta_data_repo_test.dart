import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_test_nextbase/core/network/dio_client.dart';
import 'package:flutter_bloc_test_nextbase/core/network/network_result.dart';
import 'package:flutter_bloc_test_nextbase/core/services/service_path.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/respository/video_meta_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kiwi/kiwi.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'video_meta_data_repo_test.mocks.dart';

@GenerateMocks([DioClient])
void main() async {
  var client = MockDioClient();
  KiwiContainer().registerFactory<DioClient>((container) => client);
  var repository = VideoMetaDataRepository();
  group("Video Meta Data Repository", () {
    test(": Success", () async {
      when(
        client.get(ServicePath.sampleData + "0"),
      ).thenAnswer((_) async {
        final file = File("test/json/video_meta_data.json");
        var map = jsonDecode(await file.readAsString());
        return Result.success(map);
      });
      var result = await repository.getVideoMetaDataModel();
      expect(result, isA<VideoMetaDataModel>());
    });
  });
}
