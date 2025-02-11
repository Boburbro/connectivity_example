import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit()
      : super(
          const ConnectivityState(
            connectivityResult: [
              ConnectivityResult.mobile,
            ],
          ),
        ) {
    checkInternet();
  }

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  checkInternet() {
    initConnectivity();
    streamSubscription = _connectivity.onConnectivityChanged.listen((event) {
      print("object");
      emit(state.copyWith(connectivityResult: event));
    });
  }

  Future<void> initConnectivity([BuildContext? context]) async {
    List<ConnectivityResult> result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      rethrow;
    }
    emit(state.copyWith(connectivityResult: result));
  }

  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
