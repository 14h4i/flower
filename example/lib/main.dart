import 'package:flutter/material.dart';
import 'package:flowner/flowner.dart';

const counterStateId = 'counter';

// Assume you have a method that fetches data from an API:
Future<int> fetchCounterFromApi() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate delay
  return 42; // Return data from API
}

void main() {
  // Create state for counter.
  Flowner.createState<int>(counterStateId, 0);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Flowner.getState<int>(counterStateId);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Flowner Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Display counter value using StateBuilder
              FlowBuilder<int>(
                stateId: counterStateId,
                builder: (context, value) {
                  return Text('Counter: $value',
                      style: const TextStyle(fontSize: 24));
                },
              ),
              const SizedBox(height: 20),

              // Button to update value synchronously.
              ElevatedButton(
                onPressed: () {
                  counter?.value++;
                },
                child: const Text('Increment by 1 (sync)'),
              ),
              const SizedBox(height: 20),

              // Button to update value asynchronously.
              ElevatedButton(
                onPressed: () async {
                  await counter?.updateAsync(() async {
                    final newValue =
                        await fetchCounterFromApi(); // Asynchronous update
                    return newValue;
                  });
                },
                child: const Text('Fetch Counter (async)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
