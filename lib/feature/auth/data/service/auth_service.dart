import 'package:fpdart/fpdart.dart';

import '../../../../core/client/local/secure_storage_client.dart';
import '../../../../core/client/remote/dio_client.dart';
import '../../../../core/data_exception.dart';
import '../../../../core/model/typedefs.dart';
import '../model/auth_model.dart';
import '../repo/auth_repo.dart';

abstract class IAuthService {
  AsyncRes<AuthModel> signIn(String email, String pass);
  AsyncRes<AuthModel> signUp(
    String email,
    String pass,
    String name,
    String firstName,
    String lastName,
  );
  Future<dynamic> signOut();
  Future<void> writeToken(String token);
  Future<String?> readToken();
  Future<void> deleteToken();
  void cacheToken(String token);
}

class AuthService implements IAuthService {
  AuthService(this._authRepo, this._storage);

  final IAuthRepo _authRepo;
  final SecureStorageClient _storage;

  @override
  AsyncRes<AuthModel> signIn(String email, String pass) async {
    try {
      final json = await _authRepo.signIn(email, pass);
      return right(AuthModel.fromJson(json.data!));
    } catch (e) {
      return left(
        Err(e),
      );
    }
  }

  @override
  AsyncRes<AuthModel> signUp(
    String email,
    String pass,
    String name,
    String firstName,
    String lastName,
  ) async {
    try {
      final json =
          await _authRepo.signUp(email, pass, name, firstName, lastName);
      return right(AuthModel.fromJson(json.data!));
    } catch (e) {
      return left(
        Err(e),
      );
    }
  }

  @override
  Future<dynamic> signOut() {
    return deleteToken();
  }

  @override
  Future<void> writeToken(String token) async {
    await _storage.write(SecureKeys.token, token);
  }

  @override
  Future<String?> readToken() async {
    return _storage.read(SecureKeys.token);
  }

  @override
  Future<void> deleteToken() async {
    DioClient.accessToken = '';
    await _storage.delete(SecureKeys.token);
  }

  @override
  void cacheToken(String token) {
    DioClient.accessToken = token;
  }
}
