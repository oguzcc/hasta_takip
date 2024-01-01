import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasta_takip/feature/auth/presentation/cubit/auth_cubit.dart';

import '../core/bloc/conn/conn_cubit.dart';
import '../router/router.dart';

List<BlocListener<StateStreamable<dynamic>, dynamic>> listener() {
  final listeners = <BlocListener<StateStreamable<dynamic>, dynamic>>[
    BlocListener<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        goRouter.refresh();
      },
    ),
    BlocListener<ConnCubit, ConnState>(
      listenWhen: (previous, current) =>
          previous.status != null && previous.status != current.status,
      listener: (context, state) {},
    ),
  ];
  return listeners;
}
