import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../core/util/extension/context_ext.dart';
import '../style/app_colors.dart';
import '../style/gap.dart';
import '../style/ny_icons.dart';
import '../widget/button/button.dart';
import '../widget/indicator/drag_handle.dart';

class Snack extends StatelessWidget {
  const Snack({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    super.key,
    this.body,
  });

  const Snack.success({
    required this.subtitle,
    super.key,
    this.title = 'Success',
    this.body,
  })  : icon = NyIcons.check_circle_filled,
        color = AppColors.labelMintPrimary;

  const Snack.error({
    required this.subtitle,
    this.title = 'Error',
    super.key,
  })  : body = null,
        icon = Icons.error,
        color = AppColors.systemColorRedLightPrimary;

  const Snack.info({
    required this.subtitle,
    this.title = 'Info',
    super.key,
  })  : body = null,
        icon = Icons.info,
        color = Colors.blue;

  const Snack.warning({
    required this.subtitle,
    this.title = 'Warning',
    super.key,
  })  : body = null,
        icon = NyIcons.warn_circle_outlined,
        color = AppColors.systemColorOrangeLight;

  const Snack.cancel({
    required this.title,
    required this.subtitle,
    required this.body,
    this.icon,
    super.key,
  }) : color = AppColors.systemColorRedLightPrimary;

  const Snack.undo({
    required this.title,
    required this.subtitle,
    required this.body,
    super.key,
  })  : icon = null,
        color = null;

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Color? color;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 16.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DragHandle(),
              if (icon != null) ...[
                Gap.verMD,
                Icon(icon, size: 64, color: color),
              ],
              if (title != null) ...[
                Gap.verMD,
                Text(
                  title!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.title2SemiBold,
                ),
              ],
              if (subtitle != null) ...[
                Gap.verSM,
                Text(
                  subtitle!,
                  textAlign: TextAlign.center,
                  style: context.textTheme.subheadlineRegular
                      ?.copyWith(color: context.color.labelLightSecondary),
                ),
              ],
              Gap.verMD,
              // if (body == null) Gap.verXXL,
              if (body != null) body!,
            ],
          ),
        ),
      ),
    );
  }
}

class SnackButtons extends StatelessWidget {
  const SnackButtons({
    required this.positiveTitle,
    required this.negativeTitle,
    super.key,
    this.positiveRes,
    this.negativeRes,
    this.isRed,
  });

  final String positiveTitle;
  final VoidCallback? positiveRes;
  final String negativeTitle;
  final VoidCallback? negativeRes;
  final bool? isRed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Button.cancel(
          onPressed: positiveRes,
          title: positiveTitle,
          isRed: isRed,
        ),
        Gap.verSM,
        Button.plainSec(
          onPressed: negativeRes ?? () => context.pop(),
          title: negativeTitle,
        ),
      ],
    );
  }
}
