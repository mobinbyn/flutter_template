import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';

/// A class to manage dialogs in the app, such as loading indicators and failure messages.
/// It listens to streams from [LoadingManager] and [FailedManager] to show or hide dialogs.
class DialogManager {
  DialogManager(this._globalNavigationKey, this._loadingManager, this._failedManager);

  final GlobalKey<NavigatorState> _globalNavigationKey; // Global navigation key to access the app's context
  final LoadingManager _loadingManager; // Manages loading state
  final FailedManager _failedManager; // Manages failure state

  bool _isLoadingShown = false; // Tracks if the loading dialog is currently shown
  bool _isFailedShown = false; // Tracks if the failure dialog is currently shown

  // Retrieves the current global context from the navigation key
  BuildContext get _globalContext => _globalNavigationKey.currentState!.context;

  // Getters for loading and failure managers
  LoadingManager get loadingManager => _loadingManager;
  FailedManager get failedManager => _failedManager;

  /// Initializes the dialog manager by subscribing to loading and failure streams
  void init() {
    _loadingManager.loadingStream.listen(_onLoadingStateChanged);
    _failedManager.failedStream.listen(_onFailedStateChanged);
  }

  /// Handles changes in the loading state and shows/hides the loading dialog accordingly
  void _onLoadingStateChanged(bool isLoading) {
    if (isLoading) {
      _isLoadingShown = true;
      // Shows a dialog with a circular progress indicator when loading
      showDialog(
        context: _globalContext,
        barrierColor: const Color.fromARGB(128, 0, 0, 0), // Semi-transparent background
        builder: (context) => const CircularProgressIndicator(),
      ).whenComplete(() => _isLoadingShown = false);
    } else if (_isLoadingShown) {
      _isLoadingShown = false;
      _dismissDialog(_globalContext); // Dismisses the dialog when loading completes
    }
  }

  /// Handles changes in the failure state and shows/hides the failure dialog accordingly
  void _onFailedStateChanged((bool, {Failure? failure, void Function()? retryAction}) arg) {
    if (arg.$1) {
      _isFailedShown = true;
      // Shows a modal bottom sheet for failure dialog
      showModalBottomSheet(
        context: _globalContext,
        builder: (context) {
          return Container(); // TODO: Implement the failure UI
        },
      ).whenComplete(() => _isFailedShown = false);
    } else if (_isFailedShown) {
      _isFailedShown = false;
      _dismissDialog(_globalContext); // Dismisses the failure dialog when failure resolves
    }
  }

  /// Dismisses the current dialog if it is still showing
  void _dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true); // Closes the dialog
    }
  }

  /// Checks if there is a currently showing dialog
  bool _isThereCurrentDialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;
}

/// A class to manage the loading state of the app.
/// The loading UI is shown or hidden via [DialogManager].
class LoadingManager {
  final _loadingStreamController = StreamController<bool>(); // Stream controller for loading state

  // Stream that emits loading state changes (true for loading, false for idle)
  Stream<bool> get loadingStream => _loadingStreamController.stream;

  /// Show the loading state by emitting `true`
  void show() => _setState(true);

  /// Hide the loading state by emitting `false`
  void hide() => _setState(false);

  // Internal function to update the loading state
  void _setState(bool state) {
    _loadingStreamController.add(state); // Adds the state to the stream
  }
}

/// A class to manage the failure state of the app.
/// Displays failure messages via [DialogManager] and supports retry actions.
class FailedManager {
  final _failedStreamController = StreamController<(bool, {Failure? failure, void Function()? retryAction})>();

  // Stream that emits failure state changes
  Stream<(bool, {Failure? failure, void Function()? retryAction})> get failedStream => _failedStreamController.stream;

  /// Show the failure state by emitting `true` with an optional [Failure] and [retryAction]
  void show(Failure failure, {void Function()? retryAction}) => _setState(true, failure: failure, retryAction: retryAction);

  /// Hide the failure state by emitting `false`
  void hide() => _setState(false);

  // Internal function to update the failure state
  void _setState(bool isFailed, {Failure? failure, void Function()? retryAction}) {
    _failedStreamController.add((isFailed, failure: failure, retryAction: retryAction)); // Adds the state to the stream
  }
}
