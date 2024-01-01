import 'dart:io';

import 'package:flutter/material.dart';

class LanguageManager {
  factory LanguageManager.instance() {
    _instance ??= LanguageManager._init();
    return _instance!;
  }
  LanguageManager._init();

  static LanguageManager? _instance;

  final dlLocale = const Locale('en', 'US');
  final enLocale = const Locale('en');
  // final trLocale = const Locale('tr');
  // final ruLocale = const Locale('ru');
  // final uaLocale = const Locale('ua');

  List<Locale> get supportedLocales => [
        dlLocale,
        enLocale,
        // trLocale,
        // ruLocale,
        // uaLocale,
      ];

  // constants
  static const supportedLanguages = <String>[
    'en',
    // 'tr',
    // 'ru',
    // 'ua',
  ];

  Locale getCurrentLocale() {
    return supportedLanguages.contains(getCurrentLang)
        ? Locale(getCurrentLang)
        : const Locale('en');
  }

  Locale get fallbackLocale => dlLocale;

  String get getCurrentLang => Platform.localeName.substring(0, 2);

  String get path => 'assets/translations';
}
