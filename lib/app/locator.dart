import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hasta_takip/feature/auth/data/repo/auth_repo.dart';
import 'package:hasta_takip/feature/auth/data/service/auth_service.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/client/local/hive_client.dart';
import '../core/client/local/secure_storage_client.dart';
import '../core/client/local/shared_client.dart';
import '../core/client/remote/dio_client.dart';
import '../core/config/flavor_config.dart';

Future<List<RepositoryProvider<dynamic>>> locator({
  bool isMock = false,
}) async {
  final dio = Dio();

  //TODO: add ios and android options for secure storage.

  const secureStorage = FlutterSecureStorage();
  final sharedPreferences = await SharedPreferences.getInstance();
  final hiveBox = await Hive.openBox<dynamic>(HiveKeys.box.name);
  // Hive.registerAdapter(UserAdapter()); //TODO: add adapter for each model.

  final providers = <RepositoryProvider<dynamic>>[
    RepositoryProvider<SecureStorageClient>(
      create: (context) => SecureStorageClient(secureStorage),
    ),
    RepositoryProvider<SharedClient>(
      create: (context) => SharedClient(sharedPreferences),
    ),
    RepositoryProvider<HiveClient>(
      create: (context) => HiveClient(hiveBox),
    ),
    RepositoryProvider<DioClient>(
      create: (context) => DioClient(dio, FlavorConfig.instance().apiOptions!),
    ),
    RepositoryProvider<IAuthRepo>(
      create: (context) => AuthRepo(context.read()),
    ),
    RepositoryProvider<IAuthService>(
      create: (context) => AuthService(context.read(), context.read()),
    ),
  ];
  if (isMock) {
    return [];
  } else {
    return providers;
  }
}
