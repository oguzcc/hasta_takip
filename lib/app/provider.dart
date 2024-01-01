import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasta_takip/feature/auth/presentation/cubit/auth_cubit.dart';

import '../core/bloc/conn/conn_cubit.dart';

List<BlocProvider<StateStreamableSource<Object?>>> provider() {
  final providers = <BlocProvider>[
    BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(context.read()),
    ),
    BlocProvider<ConnCubit>(
      create: (context) => ConnCubit(connectivity: Connectivity())..listen(),
    ),
  ];
  return providers;
}
