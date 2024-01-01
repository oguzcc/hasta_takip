import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../core/bloc/lang/lang_manager.dart';
import '../core/bloc_observer.dart';
import 'listener.dart';
import 'locator.dart';
import 'provider.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  // Add cross-flavor configuration here
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await FlutterMapTileCaching.initialise();
  //TODO: error on android cause of isar nosqldb (research)
  // await FMTC.instance('mapStore').manage.createAsync();
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
  runApp(
    EasyLocalization(
      path: LangManager.instance().path,
      useOnlyLangCode: true,
      supportedLocales: LangManager.instance().supportedLocales,
      useFallbackTranslations: true,
      startLocale: LangManager.instance().dlLocale,
      fallbackLocale: LangManager.instance().fallbackLocale,
      child: MultiRepositoryProvider(
        providers: await locator(),
        child: MultiBlocProvider(
          providers: provider(),
          child: MultiBlocListener(
            listeners: listener(),
            child: await builder(),
          ),
        ),
      ),
    ),
  );
}
