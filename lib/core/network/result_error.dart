import 'dart:io';

import 'package:dio/dio.dart';

enum ErrorCode {
  generic,
  emptyContent,
  noConnection,
  notFound,
  badRequest,
  unAuthorized
}

class ResultError {
  late String title;
  late String message;
  late ErrorCode code;

  ResultError() {
    message = "Something went wrong.";
    code = ErrorCode.generic;
  }

  void _handleOtherError(DioError error) {
    switch (error.error.runtimeType) {
      case SocketException:
        {
          title = "No connection";
          message = "Please check your internet connection & try again";
          code = ErrorCode.noConnection;
        }
        break;

      default:
        message = "Something went wrong.";
        code = ErrorCode.generic;
        break;
    }
  }

  void _handleResponseError(Response response) {
    switch (response.statusCode) {
      case HttpStatus.unauthorized:
        message = "Unauthorized Access.";
        code = ErrorCode.unAuthorized;
        break;

      case HttpStatus.badRequest:
        message = "Something went wrong.";
        code = ErrorCode.badRequest;
        break;

      case HttpStatus.notFound:
        message = "Something went wrong.";
        code = ErrorCode.notFound;
        break;

      default:
        message = "Something went wrong.";
        code = ErrorCode.generic;
        break;
    }
  }

  ResultError.fromResponse(DioError error) {
    switch (error.type) {
      case DioErrorType.other:
        _handleOtherError(error);
        break;

      case DioErrorType.response:
        _handleResponseError(error.response!);
        break;

      default:
        message = "Something went wrong.";
        code = ErrorCode.generic;
        break;
    } //end switch
  }

  ResultError.emptyContent() {
    message = "No content available.";
    code = ErrorCode.emptyContent;
  }

  ResultError.noConnection() {
    title = "No connection";
    message = "Please check your internet connection & try again";
    code = ErrorCode.noConnection;
  }

  ResultError.fromMessage(String errorMessage) {
    message = errorMessage;
    code = ErrorCode.generic;
  }
}
