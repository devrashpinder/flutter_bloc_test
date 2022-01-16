import 'dart:convert';
import 'dart:io';

import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_map_cubit/video_map_path_cubit.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/presentation/map_page/video_map_journey_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVideoMapCubit extends MockCubit<PageCubitState>
    implements VideoMapPathCubit {
  MockVideoMapCubit() : super();
}

class FakeLinksState extends Fake implements PageCubitState {}

void main() {
  late VideoMapPathCubit cubit;
  List<LatLng> latLngs = [];

  setUpAll(() async {
    registerFallbackValue(FakeLinksState());
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
    cubit = MockVideoMapCubit();
  });
  group('Video Map Path Widget Test', () {
    testWidgets(': Apple Map', (tester) async {
      when(() => cubit.state).thenReturn(PageCubitSuccessState(latLngs));
      await tester.pumpWidget(BlocProvider.value(
        value: cubit,
        child: const MaterialApp(home: VideoJourneyPathMapPage()),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(AppleMap), findsOneWidget);
    });
  });
}
