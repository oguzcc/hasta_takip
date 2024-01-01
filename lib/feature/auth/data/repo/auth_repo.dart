import '../../../../core/client/remote/dio_client.dart';
import '../../../../core/model/typedefs.dart';
import '../dto/signin_email_req.dart';
import '../dto/signup_email_req.dart';

enum _Path {
  signIn('/auth/login'),
  signUp('/auth/register');

  const _Path(this.name);
  final String name;
}

abstract class IAuthRepo {
  AsyncResMap signIn(String email, String pass);
  AsyncResMap signUp(
    String email,
    String pass,
    String name,
    String firstName,
    String lastName,
  );
  Future<dynamic> signOut();
}

class AuthRepo implements IAuthRepo {
  AuthRepo(this._client);
  final DioClient _client;

  @override
  AsyncResMap signIn(String email, String pass) async {
    final response = await _client.post(
      _Path.signIn.name,
      data: SignInEmailReq(email, pass).toJson(),
    );
    return response;
  }

  @override
  AsyncResMap signUp(
    String email,
    String pass,
    String name,
    String firstName,
    String lastName,
  ) async {
    final response = await _client.post(
      _Path.signUp.name,
      data: SignUpEmailReq(email, pass, name, firstName, lastName).toJson(),
    );
    return response;
  }

  @override
  Future<dynamic> signOut() {
    return _client.post('/signout');
  }
}
