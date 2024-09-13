import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';

class DialogManager {
  DialogManager(this._globalNavigationKey, this._loadingManager, this._failedManager);

  final GlobalKey<NavigatorState> _globalNavigationKey;
  final LoadingManager _loadingManager;
  final FailedManager _failedManager;
  bool _isLoadingShown = false;
  bool _isFailedShown = false;

  BuildContext get _globalContext => _globalNavigationKey.currentState!.context;
  LoadingManager get loadingManager => _loadingManager;
  FailedManager get failedManager => _failedManager;

  void init() {
    _loadingManager.loadingStream.listen(_onLoadingStateChanged);
    _failedManager.failedStream.listen(_onFailedStateChanged);
  }

  void _onLoadingStateChanged(bool isLoading) {
    if (isLoading) {
      _isLoadingShown = true;
      showDialog(
        context: _globalContext,
        barrierColor: const Color.fromARGB(128, 0, 0, 0),
        builder: (context) => const CircularProgressIndicator(),
      ).whenComplete(() => _isLoadingShown = false);
    } else if (_isLoadingShown) {
      _isLoadingShown = false;
      _dismissDialog(_globalContext);
    }
  }

  void _onFailedStateChanged((bool, {Failure? failure, void Function()? retryAction}) arg) {
    if (arg.$1) {
      _isFailedShown = true;
      showModalBottomSheet(
        context: _globalContext,
        builder: (context) {
          return Container();
        },
      ).whenComplete(() => _isFailedShown = false);
    } else if (_isFailedShown) {
      _isFailedShown = false;
      _dismissDialog(_globalContext);
    }
  }

  _dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
}

/// Manages the application state
/// The actual ui will be shown/hidden in [OverlayStateManager]
class LoadingManager {
  final _loadingStreamController = StreamController<bool>();

  Stream<bool> get loadingStream => _loadingStreamController.stream;

  void show() => _setState(true);

  void hide() => _setState(false);

  void _setState(bool state) {
    _loadingStreamController.add(state);
  }
}

class FailedManager {
  final _failedStreamController = StreamController<(bool, {Failure? failure, void Function()? retryAction})>();

  Stream<(bool, {Failure? failure, void Function()? retryAction})> get failedStream => _failedStreamController.stream;

  void show(Failure failure, {void Function()? retryAction}) => _setState(true, failure: failure, retryAction: retryAction);

  void hide() => _setState(false);

  void _setState(bool isFailed, {Failure? failure, void Function()? retryAction}) {
    _failedStreamController.add((isFailed, failure: failure, retryAction: retryAction));
  }
}
