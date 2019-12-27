// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserObject _$UserObjectFromJson(Map<String, dynamic> json) {
  return UserObject(
    json['customer'] == null
        ? null
        : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    json['access_token'] as String,
    json['refresh_token'] as String,
    json['accessTokenExpiration'] == null
        ? null
        : DateTime.parse(json['accessTokenExpiration'] as String),
    json['refreshTokenExpiration'] as String,
  );
}

Map<String, dynamic> _$UserObjectToJson(UserObject instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'user': instance.user,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'accessTokenExpiration':
          instance.accessTokenExpiration?.toIso8601String(),
      'refreshTokenExpiration': instance.refreshTokenExpiration,
    };
