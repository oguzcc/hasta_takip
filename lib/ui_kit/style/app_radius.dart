import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final class AppRadius extends BorderRadius {
  AppRadius.btn() : super.circular(14.r);
  AppRadius.card() : super.circular(14.r);
  AppRadius.input() : super.circular(14.r);
  AppRadius.chip() : super.circular(10.r);
}
