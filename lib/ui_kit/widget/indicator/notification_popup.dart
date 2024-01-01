import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../style/app_colors.dart';
import '../../style/gap.dart';
import '../../style/ny_icons.dart';

enum NotificationType {
  success,
  error,
  warning,
}

class NotificationPopup extends StatelessWidget {
  const NotificationPopup({required this.label, required this.type, super.key});

  final String label;
  final NotificationType type;

  Widget notificationType(NotificationType type) {
    if (type == NotificationType.warning) {
      return const Icon(
        NyIcons.info_i,
        color: AppColors.systemColorOrangeLight,
      );
    } else if (type == NotificationType.error) {
      return const Icon(
        NyIcons.cross,
        color: AppColors.systemColorRedLightPrimary,
      );
    } else {
      return const Icon(
        NyIcons.check,
        color: AppColors.systemColorGreenLight,
      );
    }
  }

  Color notificationColor(NotificationType type) {
    if (type == NotificationType.warning) {
      return AppColors.systemColorOrangeLight;
    } else if (type == NotificationType.error) {
      return AppColors.systemColorRedLightPrimary;
    } else {
      return AppColors.systemColorGreenLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343.w,
      height: 64.h,
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      decoration: BoxDecoration(
        color: notificationColor(type),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24.r,
            backgroundColor: context.color.labelDarkPrimary,
            child: notificationType(type),
          ),
          Gap.horSM,
          Expanded(
            child: Text(
              label,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.subheadlineRegular?.copyWith(
                color: context.color.labelDarkPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
