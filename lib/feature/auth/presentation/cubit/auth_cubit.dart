import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../router/show.dart';
import '../../data/model/auth_model.dart';
import '../../data/service/auth_service.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(const AuthState());

  final IAuthService _authService;

  bool isUserEmailNotExist(String errSlug) => errSlug == 'user_not_found';
  bool isUserEmailExist(String errSlug) => errSlug == 'password_is_not_valid';

  Future<void> authenticate() async {
    emit(state.copyWith(status: AuthStatus.authenticating));

    final token = await _authService.readToken();
    if (token == null) {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    } else {
      _authService.cacheToken(token);
      emit(state.copyWith(status: AuthStatus.authenticated));
    }
  }

  Future<void> signIn(String email, String password) async {
    final response = await _authService.signIn(email, password);

    await response.fold(
      (err) {
        final errArray = err.message.split('|');
        // final errMessage = errArray[0];
        final errSlug = errArray[1];

        if (isUserEmailNotExist(errSlug)) {
          setAuthMethod(AuthMethod.register);
        } else if (isUserEmailExist(errSlug)) {
          if (state.model.authMethod == AuthMethod.forgotPassword) {
            setAuthMethod(AuthMethod.forgotPassword);
          } else if (!(state.model.authMethod == AuthMethod.forgotPassword)) {
            setAuthMethod(AuthMethod.login);
          }
        }
        // Show.snackTop(errMessage);
      },
      (data) async {
        emit(state.copyWith(status: AuthStatus.authenticating));
        final token = '${data.token}';
        _authService.cacheToken(token);
        await _authService.writeToken(token);
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            model: state.model.copyWith(token: token, user: data.user),
          ),
        );
      },
    );
  }

  Future<void> signUp(String email, String password, String name,
      String firstName, String lastName) async {
    final response =
        await _authService.signUp(email, password, name, firstName, lastName);

    await response.fold(
      (err) {
        debugPrint(err.message);
        Show.snackTop(err.message);
      },
      (data) async {
        emit(state.copyWith(status: AuthStatus.authenticating));
        final token = '${data.token}';
        _authService.cacheToken(token);
        await _authService.writeToken(token);
        emit(
          state.copyWith(
            status: AuthStatus.authenticated,
            model: state.model.copyWith(token: token, user: data.user),
          ),
        );
      },
    );
  }

  Future<void> signOut() async {
    emit(state.copyWith(status: AuthStatus.unauthenticating));
    await _authService.signOut();
    emit(
      state.copyWith(
        status: AuthStatus.unauthenticated,
        model: const AuthModel(user: User()),
      ),
    );
  }

  void emailChanged(String email) {
    emit(state.copyWith.model.user!(email: email));
  }

  void dialCodeChanged(String dialCode) {
    emit(state.copyWith.model.user!(dialCode: dialCode));
  }

  void phoneNumberChanged(String phoneNumber) {
    emit(state.copyWith.model.user!(phoneNumber: phoneNumber));
  }

  void passwordChanged(String password) {
    emit(state.copyWith.model.user!(password: password));
  }

  void firstNameChanged(String firstName) {
    emit(state.copyWith.model.user!(firstName: firstName));
  }

  void lastNameChanged(String lastName) {
    emit(state.copyWith.model.user!(lastName: lastName));
  }

  void nameChanged(String name) {
    emit(state.copyWith.model.user!(name: name));
  }

  void clearUserState() {
    emailChanged('');
    dialCodeChanged('');
    phoneNumberChanged('');
    passwordChanged('');
    firstNameChanged('');
    lastNameChanged('');
  }

  void setAuthMethod(AuthMethod authMethod) {
    emit(state.copyWith.model(authMethod: authMethod));
  }

  void setAuthType(AuthType authType) {
    emit(state.copyWith.model(authType: authType));
  }
}
