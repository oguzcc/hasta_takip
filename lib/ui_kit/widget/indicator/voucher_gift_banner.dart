import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/util/extension/context_ext.dart';
import '../../style/app_colors.dart';
import '../../style/gap.dart';
import '../icon/svg_icon.dart';

enum BannerType { gift, voucher }

class VoucherGiftBanner extends StatelessWidget {
  const VoucherGiftBanner({required this.label, required this.type, super.key});

  final String label;
  final BannerType type;

  Widget notificationType(BannerType type) {
    if (type == BannerType.gift) {
      return SvgIcon.gift(size: 40.w);
    } else {
      return SvgIcon.voucher(size: 40.w);
    }
  }

  Color notificationColor(BannerType type) {
    if (type == BannerType.gift) {
      return const Color(0x1F34C759);
    } else {
      return const Color(0x1FFF9500);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
      decoration: BoxDecoration(
        color: notificationColor(type),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        children: [
          notificationType(type),
          Gap.horSM,
          Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.footnoteRegular?.copyWith(
              color: type == BannerType.gift
                  ? context.color.systemColorGreenLight
                  : context.color.systemColorOrangeLight,
            ),
          ),
        ],
      ),
    );
  }
}
