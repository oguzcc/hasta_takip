import '../../../../core/client/remote/dio_client.dart';
import '../../../../core/model/typedefs.dart';

enum _Path {
  me('/users/me');

  const _Path(this.path);
  final String path;
}

abstract class IUserRepo {
  AsyncResDyn getMe();
}

class UserRepo implements IUserRepo {
  UserRepo(this._client);

  final DioClient _client;

  @override
  AsyncResDyn getMe() {
    return _client.get(_Path.me.path);
  }
}
