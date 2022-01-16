import 'dart:convert';
import 'dart:io';

import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_map_cubit/video_map_path_cubit.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<LatLng> latLngs = [];
  setUpAll(() async {
    final workspaceFile = File('test/json/video_meta_data.json');
    var fileContent = await workspaceFile.readAsString();
    var map = jsonDecode(fileContent);
    final videoMetaModel = VideoMetaDataModel.fromJson(map);
    if (videoMetaModel.data!.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      videoMetaModel.data!.forEach((element) {
        latLngs.add(LatLng(element.lat!, element.lon!));
      });
    }
  });

  test('Load Map Latitude Longitude Test', () async* {
    VideoMapPathCubit cubit = VideoMapPathCubit(latLngs);
    expect(cubit.state, isA<PageCubitInitialState>());
    cubit.loadData;
    expect(cubit.state, isA<PageCubitSuccessState>());
  });
}
