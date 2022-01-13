import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc_test_nextbase/core/network/dio_client.dart';
import 'package:flutter_bloc_test_nextbase/core/network/network_result.dart';
import 'package:kiwi/kiwi.dart';
import 'package:retry/retry.dart';

import 'service_path.dart';

class MobileService {
  MobileService();

  Future<Result> getSampleVideoData(int page) async {
    var path = ServicePath.sampleData + "$page";
    final dioClient = KiwiContainer().resolve<DioClient>();
    final result = await retry(() => dioClient.get(path),
        retryIf: (e) => e is SocketException || e is TimeoutException);
    return dioClient.get(path);
  }
}