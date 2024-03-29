import 'package:flutter/material.dart';

import '../../../core/config/flavor_config.dart';

/// Widget for draw banner
class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    super.key,
    this.child,
    this.color,
    this.location,
  });

  /// Widget inside FlavorBanner
  final Widget? child;

  /// Color of the banner
  final Color? color;

  /// Location of the banner
  final BannerLocation? location;

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.instance().name == null ||
        FlavorConfig.instance().name!.isEmpty) {
      return child!;
    }

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Banner(
        color: color ?? FlavorConfig.instance().color,
        message: FlavorConfig.instance().name!,
        location:
            location != null ? location! : FlavorConfig.instance().location,
        textStyle: TextStyle(
          color: (HSLColor.fromColor(color ?? FlavorConfig.instance().color)
                      .lightness <
                  0.8
              ? Colors.white
              : Colors.black87),
          fontSize: 12.0 * 0.85,
          fontWeight: FontWeight.w900,
          height: 1,
        ),
        child: Stack(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          children: [
            child!,
            Material(
              color: Colors.transparent,
              child: IconButton(
                icon: const Icon(
                  Icons.apps_rounded,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
