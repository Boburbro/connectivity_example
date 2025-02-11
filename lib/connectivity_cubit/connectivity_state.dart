part of 'connectivity_cubit.dart';

@immutable
class ConnectivityState extends Equatable {
  const ConnectivityState({required this.connectivityResult});

  final List<ConnectivityResult> connectivityResult;

  ConnectivityState copyWith({
    required List<ConnectivityResult> connectivityResult,
  }) =>
      ConnectivityState(connectivityResult: connectivityResult);

  @override
  List<Object?> get props => [connectivityResult];
}
