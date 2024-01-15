import 'package:flutter/material.dart';

class TimerController extends ChangeNotifier {
  static TimerController? _instance;
  static TimerController get instance {
    _instance ??= TimerController._init();
    return _instance!;
  }

  TimerController._init();
}
