import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_widget.dart';

class PlatformLoadingWidget extends PlatformWidget<CupertinoActivityIndicator,
    CircularProgressIndicator> {
  const PlatformLoadingWidget({Key? key}) : super(key: key);

  @override
  CupertinoActivityIndicator createIosWidget(BuildContext context) =>
      const CupertinoActivityIndicator(radius: 16);

  @override
  CircularProgressIndicator createAndroidWidget(BuildContext context) =>
      const CircularProgressIndicator();
}
