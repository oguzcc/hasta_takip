import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/util/extension/context_ext.dart';
import '../../../../ui_kit/style/app_colors.dart';
import '../../../../ui_kit/widget/indicator/loading_indicator.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backgroundBaseDarkPrimary,
      body: Stack(
        children: [
          Center(
            child: Text(
              'Hasta Takip',
              style: context.textTheme.largeTitleBold
                  ?.copyWith(color: context.color.labelDarkPrimary),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: const LoadingIndicator.bottom(),
          ),
        ],
      ),
    );
  }
}
