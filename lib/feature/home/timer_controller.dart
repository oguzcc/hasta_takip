import 'dart:async';

class TimerController {
  late Timer _timer;
  int _elapsedSeconds = 0;

  bool get isRunning => _timer.isActive;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _elapsedSeconds++;
    });
  }

  void stop() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  int get elapsedSeconds => _elapsedSeconds;
}
