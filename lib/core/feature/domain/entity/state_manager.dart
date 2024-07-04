import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Manages the application state
/// The actual ui will be shown/hidden in [OverlayStateManager]
abstract class StateManager {
  final _stateStreamController = StreamController<bool>();

  Stream<bool> get stateStream => _stateStreamController.stream;

  void show() => _setState(true);

  void hide() => _setState(false);

  void showOverlay(BuildContext context);

  void _setState(bool state) {
    _stateStreamController.add(state);
  }
}

class LoadingStateManger extends StateManager {
  @override
  showOverlay(BuildContext context) {
    // TODO: The template value
    showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                // color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 12.h),
                  ),
                ]),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FailedStateManger extends StateManager {
  @override
  void showOverlay(BuildContext context) {
    // TODO: The template value
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container();
      },
    );
  }
}
