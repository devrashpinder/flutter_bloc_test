import 'package:flutter/material.dart';

import 'inject/injector.dart';
import 'presentation/home_page/video_chart_home_page.dart';

void main() {
  Di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(color: Colors.white)),
      home: const VideoChartHomeScreen(),
    );
  }
}
