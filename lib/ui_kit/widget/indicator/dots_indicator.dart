import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    required this.controller,
    this.pageLength = 1,
    super.key,
  });
  final PageController controller;
  final int pageLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.h),
      child: SmoothPageIndicator(
        controller: controller,
        count: pageLength,
        effect: const ColorTransitionEffect(
          dotHeight: 8,
          dotWidth: 8,
          dotColor: Color(0x4DFFFFFF),
          activeDotColor: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
