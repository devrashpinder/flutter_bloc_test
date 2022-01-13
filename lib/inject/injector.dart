import 'package:flutter_bloc_test_nextbase/core/network/dio_client.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.factory(DioClient)
  void configure();
}

class Di {
  static void setup() {
    var injector = _$Injector();
    injector.configure();
  }
}
