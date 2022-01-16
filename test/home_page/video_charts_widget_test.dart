import 'dart:convert';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_nextbase/bloc/events/page_events.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_charts_bloc/video_charts_bloc.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/presentation/home_page/video_chart_home_page.dart';
import 'package:flutter_bloc_test_nextbase/presentation/home_page/widgets/line_chart_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockVideoChartsBloc extends MockCubit<PageCubitState>
    implements VideoChartsBloc {
  MockVideoChartsBloc() : super();
}

class FakePageCubitState extends Fake implements PageCubitState {}

void main() {
  late VideoChartsBloc cubit;
  late VideoMetaDataModel videoMetaModel;

  setUpAll(() async {
    registerFallbackValue(FakePageCubitState());
    final workspaceFile = File('test/json/video_meta_data.json');
    var fileContent = await workspaceFile.readAsString();
    var map = jsonDecode(fileContent);
    videoMetaModel = VideoMetaDataModel.fromJson(map);
    cubit = MockVideoChartsBloc();
    cubit.add(PageLoadingEvents());
  });
  group('Video Chart Page Widget Test', () {
    testWidgets('', (tester) async {
      when(() => cubit.state)
          .thenReturn(PageCubitSuccessState(videoMetaModel.data!));
      await tester.pumpWidget(BlocProvider.value(
        value: cubit,
        child: const MaterialApp(home: VideoChartHomePage()),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(VideoLineChartsWidget), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(1));
      expect(find.byType(Sparkline), findsNWidgets(3));
      expect(find.byType(ElevatedButton), findsNWidgets(1));
    });
  });
}
