import 'package:flutter_test/flutter_test.dart';
import 'package:flower/flower.dart';

void main() {
  group('State Tests', () {
    // Test for simple state update
    test('State value should update', () {
      final state = FlowState<int>(0);
      state.value = 1;
      expect(state.value, 1);
    });

    // Test for state stream updates
    test('State stream should emit updates', () async {
      final state = FlowState<int>(0);

      expectLater(state.stream, emitsInOrder([1, 2, 3]));

      state.value = 1;
      state.value = 2;
      state.value = 3;
    });

    // Test for creating and retrieving a state using Flower
    test('Flower should create and retrieve state', () {
      final state = Flower.createState<int>('test', 0);
      expect(Flower.getState<int>('test'), state);
    });

    // Test for removing a state using Flower
    test('Flower should remove state', () {
      Flower.createState<int>('test-remove', 0);
      Flower.removeState('test-remove');
      expect(Flower.getState<int>('test-remove'), isNull);
    });

    // Test for asynchronous state update
    test('updateAsync should update state with async value', () async {
      final state = FlowState<int>(0);

      // Simulate an asynchronous operation that returns a new value.
      await state.updateAsync(() async {
        await Future.delayed(const Duration(seconds: 1));
        return 42;
      });

      // Check if the state value is updated after async operation.
      expect(state.value, 42);
    });

    // Test for updateAsync when an error occurs
    test('updateAsync should not update state on error', () async {
      final state = FlowState<int>(0);

      // Simulate an error in the async operation.
      await state.updateAsync(() async {
        await Future.delayed(const Duration(seconds: 1));
        throw Exception('Async error');
      });

      // The value should not change if an error occurs.
      expect(state.value, 0);
    });
  });
}
