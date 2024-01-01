// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthModelImpl _$$AuthModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthModelImpl(
      authMethod: $enumDecodeNullable(_$AuthMethodEnumMap, json['authMethod']),
      authType: $enumDecodeNullable(_$AuthTypeEnumMap, json['authType']),
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthModelImplToJson(_$AuthModelImpl instance) =>
    <String, dynamic>{
      'authMethod': _$AuthMethodEnumMap[instance.authMethod],
      'authType': _$AuthTypeEnumMap[instance.authType],
      'token': instance.token,
      'user': instance.user,
    };

const _$AuthMethodEnumMap = {
  AuthMethod.register: 'register',
  AuthMethod.login: 'login',
  AuthMethod.forgotPassword: 'forgotPassword',
  AuthMethod.editProfile: 'editProfile',
};

const _$AuthTypeEnumMap = {
  AuthType.email: 'email',
  AuthType.phone: 'phone',
};

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      dialCode: json['dialCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String? ?? '',
      lastName: json['lastName'] as String? ?? '',
      language: json['language'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'dialCode': instance.dialCode,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'language': instance.language,
      'currency': instance.currency,
    };
