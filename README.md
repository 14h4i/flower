# Flowner - A Lightweight Flutter State Management Solution

---

[![Pub](https://img.shields.io/pub/v/flowner.svg)](https://pub.dev/packages/flowner)

**Flowner** is a minimal, efficient, and intuitive state management library for Flutter. Built with simplicity and performance in mind, it provides developers with the tools to manage state effectively in Flutter applications without relying on third-party state management solutions. 

Whether you're building a small app or a large-scale application, Flowner adapts to your needs with its powerful yet easy-to-use API.

---

## ✨ Features

- **Stream-based State Management**: Efficiently updates UI components only when relevant state changes.
- **Support for Complex States**: Handle nested structures like Lists, Maps, and custom objects.
- **Asynchronous State Updates**: Seamlessly manage async operations with built-in support for future-based updates.
- **Memory-safe**: Prevent memory leaks with a simple `dispose` method for state cleanup.
- **Lightweight**: No external dependencies — just pure Dart.

---

## 🚀 Getting Started

### Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flowner: ^1.0.0
```

Then, run:

```bash
flutter pub get
```

## 🔧 Usage

### Creating and Updating State

```dart
import 'package:flowner/flowner.dart';

void main() {
  // Initialize a state with a default value
  final counterState = State<int>(0);

  // Listen to state changes
  counterState.stream.listen((newValue) {
    print('Counter updated: $newValue');
  });

  // Update state synchronously
  counterState.value = 1;  // Output: Counter updated: 1

  // Update state asynchronously
  counterState.updateAsync(() async {
    await Future.delayed(Duration(seconds: 2));
    return 42;
  }).then((_) {
    print('Counter updated: ${counterState.value}');  // Output: Counter updated: 42
  });
}
```

### Dispose State
To avoid memory leaks, always dispose of states when they are no longer needed:

```dart
state.dispose();
```

## 📱 Example Application

To see `flowner` in action, check out the example project in the [example](https://github.com/14h4i/flowner/blob/master/example/lib/main.dart).

## 🌟 Key API Methods

| Method               | Description                                                             |
|----------------------|-------------------------------------------------------------------------|
| `value`              | Get or set the current state value.                                    |
| `stream`             | A stream that emits the state value whenever it changes.              |
| `dispose()`          | Cleans up resources associated with the state.                        |
| `updateAsync(func)`  | Updates the state asynchronously using a provided future-based function.|


## 🛠️ Contributions

We welcome contributions! If you have ideas for features, bug fixes, or improvements, feel free to open an issue or submit a pull request.

## 🐞 Issues and feedback

Please file [issues](https://github.com/14h4i/flowner/issues) to send feedback or report a bug. Thank you!

## 📜 License

[MIT](https://mit-license.org) License

<a href="https://www.buymeacoffee.com/14h4i" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
