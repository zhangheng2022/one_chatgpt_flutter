// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) => Userinfo(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$UserinfoToJson(Userinfo instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'age': instance.age,
    };