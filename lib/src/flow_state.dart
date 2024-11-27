import 'dart:async';

import 'package:flutter/foundation.dart';

/// Manages state and notifies listeners using Streams.
class FlowState<T> {
  T _value;
  final StreamController<T> _controller;

  // Constructor initializes the state and adds the initial value to the stream
  FlowState(this._value) : _controller = StreamController<T>.broadcast();

  /// Get the current value of the state.
  T get value => _value;

  /// Stream for observing state changes.
  Stream<T> get stream => _controller.stream;

  /// Update the state and notify listeners if the value has changed.
  set value(T newValue) {
    if (_value != newValue) {
      _value = newValue;
      _controller.add(_value);
    }
  }

  // Update value asynchronously (example for async operations)
  Future<void> updateAsync(Future<T> Function() updateFunc) async {
    try {
      final result = await updateFunc();
      value = result; // Update state after async operation
    } catch (e) {
      // Handle error if any
      if (kDebugMode) {
        print('Error during async state update: $e');
      }
    }
  }

  /// Dispose the StreamController when the state is no longer needed.
  void dispose() {
    _controller.close();
  }
}
