import 'package:flutter/material.dart';
import '../../domain/entity/state_manager.dart';

/// Example to use in bloc
// void login() async {
//   _loadingManager.show();
//
//   await _loginUseCase();
//
//   _loadingManager.hide();
// }

class OverlayStateManager<T extends StateManager> {
  OverlayStateManager(
    this._globalNavigationKey,
    this._stateManager,
  );

  final GlobalKey<NavigatorState> _globalNavigationKey;
  final T _stateManager;

  BuildContext get _globalContext => _globalNavigationKey.currentState!.context;

  void init() {
    _stateManager.stateStream.listen(_onStateChanged);
  }

  void _onStateChanged(bool isShow) {
    if (isShow) {
      // TODO: show your loading dialog, showDialog(...)
    } else {
      // TODO: hide your dialog using the navigation lib in you app
    }
  }
}
