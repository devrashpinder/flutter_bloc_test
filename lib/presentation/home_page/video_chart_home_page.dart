import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_nextbase/bloc/events/page_events.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_charts_bloc/video_charts_bloc.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/respository/video_meta_repo.dart';
import 'package:flutter_bloc_test_nextbase/presentation/utility/loading_widget/wait_widget.dart';

import 'widgets/line_chart_widget.dart';

class VideoChartHomeScreen extends StatelessWidget {
  const VideoChartHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoChartsBloc(VideoMetaDataRepository())..add(PageLoadingEvents()),
      child: const VideoChartHomePage(),
    );
  }
}

/// this page is display the charts of Video meta data
class VideoChartHomePage extends StatelessWidget {
  const VideoChartHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Sample Charts")),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<VideoChartsBloc, PageCubitState>(builder: (_, state) {
      if (state is PageCubitInitialState || state is PageCubitLoadingState) {
        return const WaitWidget();
      } else if (state is PageCubitSuccessState) {
        return VideoLineChartsWidget(videoMetaData: state.result);
      } else if (state is PageCubitFailureState) {
        return Text(state.error.message);
      }
      return const SizedBox();
    });
  }
}
