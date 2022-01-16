import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_test_nextbase/core/network/result_error.dart';

abstract class PageCubitState extends Equatable {}

class PageCubitInitialState extends PageCubitState {
  PageCubitInitialState();
  @override
  List<Object> get props => [];
}

class PageCubitLoadingState extends PageCubitState {
  PageCubitLoadingState();
  @override
  List<Object> get props => [];
}

class PageCubitSuccessState extends PageCubitState {
  final dynamic result;
  final DateTime time = DateTime.now();
  PageCubitSuccessState(this.result);
  @override
  List<Object> get props => [time];

  PageCubitSuccessState copyWith({dynamic result}) {
    return PageCubitSuccessState(result ?? this.result);
  }
}

class PageCubitFailureState extends PageCubitState {
  final ResultError error;
  PageCubitFailureState(this.error);
  @override
  List<Object> get props => [error];
}
