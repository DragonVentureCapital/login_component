// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    json['id'] as String,
    json['gender'] as int,
    json['imagePath'] as String,
    json['cpf'] as String,
    json['phoneNumber'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'gender': instance.gender,
      'imagePath': instance.imagePath,
      'cpf': instance.cpf,
      'phoneNumber': instance.phoneNumber,
    };
