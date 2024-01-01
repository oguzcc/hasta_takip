part of 'auth_cubit.dart';

enum AuthStatus {
  initial,
  authenticating,
  authenticated,
  unauthenticating,
  unauthenticated
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    @Default(AuthModel(user: User())) AuthModel model,
  }) = _AuthState;
}
