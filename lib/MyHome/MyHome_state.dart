import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MyHomeState extends Equatable {
  MyHomeState([Iterable props]) : super(props);

  /// Copy object for use in action
  MyHomeState getStateCopy();
}

/// UnInitialized
class UnMyHomeState extends MyHomeState {
  @override
  String toString() => 'UnMyHomeState';

  @override
  MyHomeState getStateCopy() {
    return UnMyHomeState();
  }
}

/// Initialized
class InMyHomeState extends MyHomeState {
  @override
  String toString() => 'InMyHomeState';

  @override
  MyHomeState getStateCopy() {
    return InMyHomeState();
  }
}

class ErrorMyHomeState extends MyHomeState {
  final String errorMessage;

  ErrorMyHomeState(this.errorMessage);
  
  @override
  String toString() => 'ErrorMyHomeState';

  @override
  MyHomeState getStateCopy() {
    return ErrorMyHomeState(this.errorMessage);
  }
}
