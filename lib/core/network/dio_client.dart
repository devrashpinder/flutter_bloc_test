// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter_bloc_test_nextbase/core/services/http_exception.dart';
import 'package:flutter_bloc_test_nextbase/core/services/service_path.dart';

import 'network_result.dart';
import 'package:dio/dio.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    var options = BaseOptions(baseUrl: BaseUrl.dev, headers: {
      'content-type': 'application/json',
    });
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, logPrint: (log) => print(log)));
  }

  Future<Result> get(String path) async {
    Response response;
    try {
      response = await dio.get(path);
      if (response.statusCode == HttpStatus.ok) {
        return Result.success(response.data);
      } else {
        return Result.failure(response);
      }
    } on DioError catch (exception) {
      throw HttpServerException(httpStatus: exception.response?.statusCode);
    } catch (e) {
      return Result.failure(e);
    }
  }
}
