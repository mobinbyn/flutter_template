import 'dart:async';

/// Manages the application state
/// The actual ui will be shown/hidden in [OverlayStateManager]
abstract class StateManager {
  final _stateStreamController = StreamController<bool>();

  Stream<bool> get stateStream => _stateStreamController.stream;

  void show() => _setState(true);

  void hide() => _setState(false);

  void _setState(bool state) {
    _stateStreamController.add(state);
  }
}

class LoadingStateManger extends StateManager {}

class FailedStateManger extends StateManager {}
