import 'dart:async';

/// Manages the application state
/// The actual ui will be shown/hidden in [DialogManager]
abstract class StateManager {
  final _stateStreamController = StreamController<bool>();

  Stream<bool> get stateStream => _stateStreamController.stream;

  void show() => _setState(true);

  void hide() => _setState(false);

  void _setState(bool state) {
    _stateStreamController.add(state);
  }
}

class LoadingManger extends StateManager {}

class ErrorManger extends StateManager {}
