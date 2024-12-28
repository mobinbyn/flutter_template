import '../../data/data_source/error/failure.dart';
import 'state_renderer_type.dart';

// All bloc states must implement this class
abstract class FlowState {
  StateRendererType getStateRendererType();

  Failure? getFailure();
}
