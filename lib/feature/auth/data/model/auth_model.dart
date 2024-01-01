import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

enum AuthMethod { register, login, forgotPassword, editProfile }

enum AuthType { email, phone }

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    AuthMethod? authMethod,
    AuthType? authType,
    String? token,
    User? user,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, Object?> json) =>
      _$AuthModelFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    @Default('') String name,
    @Default('') String email,
    String? dialCode,
    String? phoneNumber,
    String? password,
    @Default('') String firstName,
    @Default('') String lastName,
    String? language,
    String? currency,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
