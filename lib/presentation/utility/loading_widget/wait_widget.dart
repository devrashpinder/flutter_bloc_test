import 'package:flutter/material.dart';
import 'package:flutter_bloc_test_nextbase/presentation/utility/platform_widgets/platform_loading_widget.dart';

class WaitWidget extends StatelessWidget {
  final String? message;
  const WaitWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PlatformLoadingWidget(),
            const SizedBox(height: 8),
            Text(message!)
          ],
        ),
      );
    }
    return const Center(
      child: PlatformLoadingWidget(),
    );
  }
}

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.all(8.0),
      child: const WaitWidget(),
      color: Colors.grey,
    );
  }
}
