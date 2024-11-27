import 'flow_state.dart';

/// A centralized manager for handling application states.
class Flowner {
  static final Map<String, dynamic> _states = {};

  /// Create a new state with an initial value.
  static FlowState<T> createState<T>(String id, T initialValue) {
    if (_states.containsKey(id)) {
      throw Exception("State with id '$id' already exists.");
    }
    final state = FlowState<T>(initialValue);
    _states[id] = state;
    return state;
  }

  /// Get an existing state by its ID.
  static FlowState<T>? getState<T>(String id) {
    return _states[id] as FlowState<T>?;
  }

  /// Remove and dispose a state by its ID.
  static void removeState(String id) {
    final state = _states.remove(id) as FlowState?;
    state?.dispose();
  }
}
