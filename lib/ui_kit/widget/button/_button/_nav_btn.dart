part of '../button.dart';

class _NavBtn extends StatelessWidget {
  const _NavBtn._({required this.icon, this.onTap, this.isDark});

  factory _NavBtn.cross({VoidCallback? onTap, bool? isDark}) =>
      _NavBtn._(icon: NyIcons.cross, onTap: onTap, isDark: isDark);
  factory _NavBtn.back({VoidCallback? onTap, bool? isDark}) =>
      _NavBtn._(icon: NyIcons.chevron_left, onTap: onTap, isDark: isDark);
  factory _NavBtn.share({
    VoidCallback? onTap,
    bool? isDark,
  }) =>
      _NavBtn._(icon: NyIcons.share, onTap: onTap, isDark: isDark);
  factory _NavBtn.info({VoidCallback? onTap, bool? isDark}) =>
      _NavBtn._(icon: NyIcons.info_i, onTap: onTap, isDark: isDark);
  factory _NavBtn.likeOutlined({VoidCallback? onTap, bool? isDark}) =>
      _NavBtn._(icon: NyIcons.like_outlined, onTap: onTap, isDark: isDark);
  factory _NavBtn.reboot({VoidCallback? onTap, bool? isDark}) => _NavBtn._(
        icon: NyIcons.reboot,
        onTap: onTap,
        isDark: isDark,
      );

  final IconData icon;
  final VoidCallback? onTap;
  final bool? isDark;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 32.w,
      child: IconButton.filled(
        onPressed: onTap ?? () => context.pop(),
        constraints: BoxConstraints.tight(Size.square(32.w)),
        icon: Icon(icon, size: 20),
        style: IconButton.styleFrom(
          foregroundColor: isDark ?? false
              ? context.color.labelDarkPrimary
              : context.color.labelLightSecondary,
          backgroundColor: isDark ?? false
              ? context.color.labelLightTeartly
              : context.color.fillColorLightSecondary,
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
      ),
    );
  }
}
