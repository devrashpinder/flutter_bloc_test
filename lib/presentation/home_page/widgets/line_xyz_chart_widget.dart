import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_nextbase/data_layer/data_models/video_meta_data_model.dart';

// ignore: must_be_immutable
class VideoLineChartsWidget extends StatelessWidget {
  final List<VideoMetaData> videoMetaData;
  List<LatLng> latLngs = [];
  VideoLineChartsWidget({Key? key, required this.videoMetaData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  Widget getBody() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(16.0),
            height: 250,
            color: Colors.black,
            child: Stack(children: _combinedLineCharts())),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: _pushToMapScreen,
              child: const Text("Video Map Locations")),
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

  void _pushToMapScreen() {}
}
