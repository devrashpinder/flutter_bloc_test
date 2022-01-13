// ignore_for_file: avoid_print

import 'dart:io';

import 'network_result.dart';
import 'package:dio/dio.dart';

import 'result_error.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    var options = BaseOptions(baseUrl: "", headers: {
      'content-type': 'application/json',
    });
    dio = Dio(options);
    dio.interceptors.add(LogInterceptor(
        requestBody: true, responseBody: true, logPrint: (log) => print(log)));
  }

  Future<Result> get(String path, [Map<String, dynamic>? query]) async {
    Response response;

    try {
      if (query != null) {
        response = await dio.get(path, queryParameters: query);
      } else {
        response = await dio.get(path);
      }
      if (response.statusCode == HttpStatus.ok) {
        return Result.success(response.data);
      } else {
        return Result.failure(response);
      }
    } on DioError catch (exception) {
      final resultError = ResultError.fromResponse(exception);
      return Result.failure(resultError);
    } catch (e) {
      return Result.failure(e);
    }
  }
}
