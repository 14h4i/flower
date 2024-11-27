import 'package:flutter/widgets.dart';
import 'flower.dart';

/// A widget that rebuilds UI when the associated state changes using StreamBuilder.
class FlowBuilder<T> extends StatelessWidget {
  final String stateId;
  final Widget Function(BuildContext context, T value) builder;

  const FlowBuilder({
    required this.stateId,
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = Flower.getState<T>(stateId);
    if (state == null) {
      throw Exception("State with id '$stateId' not found.");
    }

    return StreamBuilder<T>(
      stream: state.stream,
      initialData: state.value,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data as T);
        } else {
          return const SizedBox.shrink(); // Handle empty state if needed.
        }
      },
    );
  }
}
