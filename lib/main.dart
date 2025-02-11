import 'package:connectivity_example/connectivity_cubit/connectivity_cubit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ConnectivityCubit(),
        // child: Scaffold(),

        child: BlocListener<ConnectivityCubit, ConnectivityState>(
          listener: (context, state) {
            print(state);
            if (state.connectivityResult.contains(ConnectivityResult.mobile) ||
                state.connectivityResult.contains(ConnectivityResult.wifi)) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    body: Center(
                      child: Text("Wow net bor myazza"),
                    ),
                  ),
                ),
              );
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: Text("Internet yo'q")),
                    body: Center(child: Text("Iltimos, internetni yoqing!")),
                  ),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(title: Text("Internet yo'q")),
            body: Center(child: Text("Iltimos, internetni yoqing!")),
          ),
        ),
      ),
    );
  }
}
