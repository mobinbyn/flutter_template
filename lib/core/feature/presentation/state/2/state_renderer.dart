import 'package:flutter/material.dart';
import 'package:flutter_template/core/feature/data/data_source/error/failure.dart';
import 'package:flutter_template/core/feature/domain/entity/state_renderer_type.dart';

class StateRenderer<T> extends StatelessWidget {
  final StateRendererType stateRendererType;
  final Failure? failure;
  final Future<T> Function(dynamic)? retryAction;
  final Function? secondaryAction;

  const StateRenderer({
    super.key,
    required this.stateRendererType,
    this.failure,
    this.retryAction,
    this.secondaryAction,
  });

  @override
  Widget build(BuildContext context) {
    return _getContent(context);
  }

  Widget _getContent(BuildContext context) {
    switch (stateRendererType) {
      /// Initial State
      case StateRendererType.initialState:

      /// Loading State
      case StateRendererType.fullScreenLoadingState:

      /// Error State
      case StateRendererType.fullScreenErrorState:

      /// Success State
      case StateRendererType.popupSuccess:
      case StateRendererType.contentScreenState:

      /// Empty State
      case StateRendererType.emptyScreenState:
      case StateRendererType.idle:
      default:
        return Container();
    }
  }
}
