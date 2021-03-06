import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_map_cubit/video_map_path_cubit.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';
import 'package:flutter_bloc_test_nextbase/presentation/map_page/video_map_journey_page.dart';

// ignore: must_be_immutable
class VideoLineChartsWidget extends StatelessWidget {
  final List<VideoMetaData> videoMetaData;
  List<LatLng> latLngs = [];
  VideoLineChartsWidget({Key? key, required this.videoMetaData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody(context);
  }

  Widget getBody(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 44),
            padding: const EdgeInsets.only(top: 44, left: 16, right: 16),
            height: 350,
            color: Colors.black,
            child: Stack(children: _combinedLineCharts())),
        Padding(
          padding: const EdgeInsets.only(top: 44),
          child: SizedBox(
            height: 44,
            child: ElevatedButton(
                onPressed: () => _pushToMapScreen(context),
                child: const Text(
                  "Video Map Locations",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
      ],
    );
  }

  List<Widget> _combinedLineCharts() {
    List<Widget> widgetList = [];
    List<double> xValues = [];
    List<double> yValues = [];
    List<double> zValues = [];
    for (var element in videoMetaData) {
      xValues.add(element.xAcc ?? 0);
      yValues.add(element.yAcc ?? 0);
      zValues.add(element.zAcc ?? 0);
      latLngs.add(LatLng(element.lat!, element.lon!));
    }
    widgetList.add(_spikeLineChart(Colors.blueAccent, xValues));
    widgetList.add(_spikeLineChart(Colors.yellow, yValues));
    widgetList.add(_spikeLineChart(Colors.red, zValues));
    return widgetList;
  }

  Widget _spikeLineChart(Color color, List<double> data) {
    return Sparkline(
        data: data, lineWidth: 1.5, lineColor: color, min: -1, max: 1);
  }

  void _pushToMapScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => VideoMapPathCubit(latLngs)..loadData(),
            child: const VideoJourneyPathMapPage(),
          ),
        ));
    //  BlocProvider(
    //   create: (context) => VideoMapPathCubit(),
    //   child: const VideoJourneyPathMapPage(),
    //)
  }
}
