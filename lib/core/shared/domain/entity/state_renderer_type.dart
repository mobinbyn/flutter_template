/// [StateRendererType] is enum class for different UI states
enum StateRendererType {
  /// [initialState] is the initial state of the screen
  initialState,
  // Popup State
  /// [StateRendererType.popupLoadingState] is for loading state in popup mode.
  popupLoadingState,

  /// [StateRendererType.popupErrorState] is for error state in popup mode.
  popupErrorState,

  /// [StateRendererType.popupSuccess] is for success state in popup mode.
  popupSuccess,

  // Full Screen State
  /// [StateRendererType.fullScreenLoadingState] is for loading state, show in content body.
  fullScreenLoadingState,

  /// [StateRendererType.fullScreenErrorState] is for error state, show in content body.
  fullScreenErrorState,

  /// [StateRendererType.contentScreenState] is the Ui of the screen.
  contentScreenState,

  /// [StateRendererType.emptyScreenState] is for empty state, when we receive no data from API side for list screen
  emptyScreenState,

  /// [StateRendererType.idle] is idle state.
  idle,
}
