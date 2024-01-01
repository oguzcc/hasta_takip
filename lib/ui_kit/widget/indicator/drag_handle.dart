import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../style/app_colors.dart';

class DragHandle extends StatelessWidget {
  const DragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 8.h, bottom: 4.h),
        width: 40.w,
        height: 4.h,
        decoration: BoxDecoration(
          color: context.color.separatorColorLightNoTransparency,
          borderRadius: BorderRadius.circular(2.r),
        ),
      ),
    );
  }
}
