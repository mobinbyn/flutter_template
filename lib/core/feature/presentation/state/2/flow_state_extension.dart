import 'package:flutter/material.dart';
import 'package:flutter_template/core/app/di/injector_index.dart';
import 'package:flutter_template/core/feature/domain/entity/state_manager.dart';
import 'package:flutter_template/core/feature/domain/entity/state_renderer_type.dart';

import '../../../domain/entity/flow_state.dart';

extension FlowStateExtension on FlowState {
  static final _loadingManger = locator<LoadingStateManger>();
  static final _errorManger = locator<FailedStateManger>();

  Widget getScreenWidget<T>(
    BuildContext context,
    Widget screenContentBody,
    Future<T> Function(dynamic) retryAction, {
    bool rootNavigator = true,
    Function? secondaryAction,
  }) {
    switch (getStateRendererType()) {
      /// * Initial State
      case StateRendererType.initialState:

      /// * Loading State
      case StateRendererType.popupLoadingState:
        _dismissPopUp();
        _loadingManger.show();
        return screenContentBody;
      case StateRendererType.fullScreenLoadingState:

      /// * Error State
      case StateRendererType.popupErrorState:
        _dismissPopUp();
        _errorManger.show();
        return screenContentBody;
      case StateRendererType.fullScreenErrorState:

      /// * Success State
      case StateRendererType.popupSuccess:
      case StateRendererType.contentScreenState:
        _dismissPopUp();
        return screenContentBody;

      /// * Empty State
      case StateRendererType.emptyScreenState:
      case StateRendererType.idle:
        return screenContentBody;
      default:
        return Container();
    }
  }

  void _dismissPopUp() {
    _loadingManger.hide();
    _errorManger.hide();
  }
}
