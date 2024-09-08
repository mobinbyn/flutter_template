import 'package:flutter/material.dart';
import 'package:flutter_template/core/feature/domain/entity/state_renderer_type.dart';

import '../../../domain/entity/flow_state.dart';

extension FlowStateExtension on FlowState {
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
        return screenContentBody;
      case StateRendererType.fullScreenLoadingState:

      /// * Error State
      case StateRendererType.popupErrorState:
        return screenContentBody;
      case StateRendererType.fullScreenErrorState:

      /// * Success State
      case StateRendererType.popupSuccess:
      case StateRendererType.contentScreenState:
        return screenContentBody;

      /// * Empty State
      case StateRendererType.emptyScreenState:
      case StateRendererType.idle:
        return screenContentBody;
      default:
        return Container();
    }
  }
}
