// Mocks generated by Mockito 5.0.17 from annotations
// in flutter_bloc_test_nextbase/test/home_page/video_meta_data_repo_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dio/dio.dart' as _i2;
import 'package:flutter_bloc_test_nextbase/core/network/dio_client.dart' as _i4;
import 'package:flutter_bloc_test_nextbase/core/network/network_result.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeDio_0 extends _i1.Fake implements _i2.Dio {}

class _FakeResult_1<T, E> extends _i1.Fake implements _i3.Result<T, E> {}

/// A class which mocks [DioClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i4.DioClient {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio =>
      (super.noSuchMethod(Invocation.getter(#dio), returnValue: _FakeDio_0())
          as _i2.Dio);
  @override
  set dio(_i2.Dio? _dio) => super.noSuchMethod(Invocation.setter(#dio, _dio),
      returnValueForMissingStub: null);
  @override
  _i5.Future<_i3.Result<dynamic, dynamic>> get(String? path) =>
      (super.noSuchMethod(Invocation.method(#get, [path]),
              returnValue: Future<_i3.Result<dynamic, dynamic>>.value(
                  _FakeResult_1<dynamic, dynamic>()))
          as _i5.Future<_i3.Result<dynamic, dynamic>>);
}