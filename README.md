# Flower - A Lightweight Flutter State Management Solution

---

[![Pub](https://img.shields.io/pub/v/flower.svg)](https://pub.dev/packages/flower)


Flower is a simple and efficient state management package for Flutter, designed to manage both simple and complex states without relying on external state management libraries. It provides an easy-to-use API that integrates seamlessly into your Flutter applications.

## Features

- Manage simple and complex states (e.g., primitive types, Lists, Maps).
- Supports both synchronous and asynchronous state updates.
- Stream-based state updates to minimize unnecessary re-renders.
- Automatic state disposal to avoid memory leaks.
- Simple API to get, set, and listen to state changes.

## Installation

Add `flower` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flower: ^1.0.0
```

Run the following command to install the package:

```bash
flutter pub get
```

## Usage
### Creating and Updating State

```dart
import 'package:flower/flower.dart';

void main() {
  // Initialize state with a default value
  final state = State<int>(0);

  // Listening to state changes
  state.stream.listen((newValue) {
    print('State updated to: $newValue');
  });

  // Update state synchronously
  state.value = 1;  // Output: State updated to: 1

  // Update state asynchronously
  state.updateAsync(() async {
    await Future.delayed(Duration(seconds: 1));
    return 42;
  }).then((_) {
    print('State updated to: ${state.value}');  // Output: State updated to: 42
  });
}
```

### Resetting State

```dart
// Reset state to its initial value
state.value = 0;
```

### Dispose State

```dart
// Dispose the state when you're done with it to avoid memory leaks
state.dispose();
```

## Example Project
To see `flower` in action, check out the example project in the [example](https://github.com/14h4i/flower/blob/master/example/lib/main.dart).

## Contributions
Contributions are welcome! Please feel free to open issues and pull requests.

## Issues and feedback

Please file [issues](https://github.com/14h4i/flower/issues) to send feedback or report a bug. Thank you!

## License
[MIT](https://mit-license.org) License

<a href="https://www.buymeacoffee.com/14h4i" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>


