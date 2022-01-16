import 'package:apple_maps_flutter/apple_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_test_nextbase/bloc/page_states/page_cubit_states.dart';
import 'package:flutter_bloc_test_nextbase/bloc/video_map_cubit/video_map_path_cubit.dart';
import 'package:flutter_bloc_test_nextbase/presentation/utility/loading_widget/wait_widget.dart';

class VideoJourneyPathMapPage extends StatelessWidget {
  const VideoJourneyPathMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Map Path")),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<VideoMapPathCubit, PageCubitState>(builder: (_, state) {
      if (state is PageCubitInitialState || state is PageCubitLoadingState) {
        return const WaitWidget();
      } else if (state is PageCubitSuccessState) {
        return _appleMapPath(state.result);
      } else if (state is PageCubitFailureState) {
        return Text(state.error.message);
      }
      return const SizedBox();
    });
  }

  Widget _appleMapPath(List<LatLng> latLngs) {
    int middleLatLng = (latLngs.length - 1) ~/ 2;
    final Polyline polygon = Polyline(
      polylineId: PolylineId("test d"),
      consumeTapEvents: true,
      points: latLngs,
      width: 3,
      onTap: () {},
    );
    return AppleMap(
      initialCameraPosition: CameraPosition(
        target: latLngs[middleLatLng],
        zoom: 14.5,
      ),
      polylines: {polygon},
      //onMapCreated: _onMapCreated,
    );
  }
}
