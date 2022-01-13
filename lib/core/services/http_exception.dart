// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class HttpServerException implements Exception {
  /// Description of the cause of the timeout.
  final int? httpStatus;

  /// The duration that was exceeded.
  final Duration? duration;

  HttpServerException({this.httpStatus, this.duration});

  @override
  String toString() {
    String result = "TimeoutException";
    if (duration != null) result = "TimeoutException after $duration";
    if (httpStatus != null) result = "$result: $httpStatus";
    return result;
  }
}
