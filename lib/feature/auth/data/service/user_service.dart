import 'package:fpdart/fpdart.dart';

import '../../../../core/data_exception.dart';
import '../../../../core/model/typedefs.dart';
import '../model/auth_model.dart';
import '../repo/user_repo.dart';

abstract class IUserService {
  AsyncRes<User> getMe();
}

class UserService implements IUserService {
  UserService(this._userRepo);

  final IUserRepo _userRepo;

  @override
  AsyncRes<User> getMe() async {
    try {
      final res = await _userRepo.getMe();
      // ignore: avoid_dynamic_calls
      final data = User.fromJson(res.data!['user'] as Map<String, dynamic>);
      return right(data);
    } catch (e) {
      return left(Err(e));
    }
  }
}
