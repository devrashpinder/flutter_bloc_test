import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc_test_nextbase/bloc/events/page_events.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_charts_bloc/video_charts_bloc.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/respository/video_meta_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'video_charts_bloc_test.mocks.dart';

@GenerateMocks([VideoMetaDataRepository])
void main() {
  var mockRepository = MockVideoMetaDataRepository();
  late VideoMetaDataModel videoMetaModel;
  setUpAll(() async {
    final workspaceFile = File('test/json/video_meta_data.json');
    var fileContent = await workspaceFile.readAsString();
    var map = jsonDecode(fileContent);
    videoMetaModel = VideoMetaDataModel.fromJson(map);
    when(mockRepository.getVideoMetaDataModel())
        .thenAnswer((_) => Future.value(videoMetaModel));
  });

  test('Fetch Video Meta Data Test', () async* {
    VideoChartsBloc bloc = VideoChartsBloc(mockRepository);
    bloc.add(PageLoadingEvents());
    expect(bloc.state, isA<PageCubitSuccessState>());
  });
}
