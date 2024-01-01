import 'package:flutter/material.dart';

import 'api_options.dart';

enum EnvType { dev, staging, qa, prod }

/// FlavorConfig to configure flavors
class FlavorConfig {
  /// Factory constructor
  factory FlavorConfig({
    String? name,
    Color color = Colors.red,
    BannerLocation location = BannerLocation.topStart,
    IApiOption? apiOptions,
    Map<String, dynamic> variables = const {},
  }) {
    _instance = FlavorConfig._internal(
      name,
      color,
      location,
      apiOptions,
      variables,
    );

    return _instance!;
  }
  factory FlavorConfig.instance() {
    _instance ??= FlavorConfig();
    return _instance!;
  }

  /// Private constructor
  FlavorConfig._internal(
    this.name,
    this.color,
    this.location,
    this.apiOptions,
    this.variables,
  );

  /// Name of flavor
  final String? name;

  /// Color of the banner
  final Color color;

  /// Location of the banner
  final BannerLocation location;

  /// Variables are dynamic
  final Map<String, dynamic> variables;
  final IApiOption? apiOptions;

  /// Internal instance of FlavorConfig
  static FlavorConfig? _instance;
}
