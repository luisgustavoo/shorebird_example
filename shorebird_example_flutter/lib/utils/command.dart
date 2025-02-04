import 'package:flutter/foundation.dart';
import 'package:shorebird_example_flutter/utils/result.dart';

typedef CommandAction0<T> = Future<Result<T>> Function();
typedef CommandAction1<T, A> = Future<Result<T>> Function(A);

// extension CommandX<T> on Command<T> {
//   bool get hasError {
//     return result is Error;
//   }

//   bool get isRunning {
//     return running;
//   }

//   bool get isCompleted {
//     return result is Ok;
//   }
// }

sealed class Command<T> extends ChangeNotifier {
  bool running = false;
  // bool completed = false;
  Result<T>? result;
  bool get error => result is Error;
  bool get completed => result is Ok;
  Future<void> _execute(CommandAction0<T> action) async {
    if (running) {
      return;
    }
    running = true;
    result = null;
    notifyListeners();
    try {
      result = await action();
    } finally {
      running = false;
      notifyListeners();
    }
  }

  void clearResult() {
    result = null;
    notifyListeners();
  }
}

final class Command0<T> extends Command<T> {
  Command0(this._action);
  final CommandAction0<T> _action;

  Future<void> execute() async {
    await _execute(_action);
  }
}

final class Command1<T, A> extends Command<T> {
  Command1(this._action);
  final CommandAction1<T, A> _action;

  Future<void> execute(A arguments) async {
    await _execute(() => _action(arguments));
  }
}
