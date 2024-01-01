part of 'conn_cubit.dart';

enum ConnStatus {
  online('You are now online'),
  offline('You are now offline'),
  ;

  const ConnStatus(this.message);

  final String message;
}

@immutable
class ConnState extends Equatable {
  const ConnState({this.status});
  final ConnStatus? status;

  @override
  List<Object?> get props => [status];
}
