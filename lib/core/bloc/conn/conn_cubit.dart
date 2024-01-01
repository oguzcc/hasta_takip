import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'conn_state.dart';

class ConnCubit extends Cubit<ConnState> {
  ConnCubit({
    required this.connectivity,
  }) : super(const ConnState());
  final Connectivity connectivity;

  StreamSubscription<ConnectivityResult>? _subscription;

  Future<void> listen() async {
    _subscription = connectivity.onConnectivityChanged.listen(
      (result) async {
        return switch (result) {
          // ConnectivityResult.bluetooth => null,
          // ConnectivityResult.wifi => null,
          // ConnectivityResult.ethernet => null,
          // ConnectivityResult.mobile => null,
          // ConnectivityResult.other => null,
          // ConnectivityResult.vpn => null,
          ConnectivityResult.none =>
            emit(const ConnState(status: ConnStatus.offline)),
          _ => emit(const ConnState(status: ConnStatus.online)),
        };
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
