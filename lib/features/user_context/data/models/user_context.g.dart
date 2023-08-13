// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserContext _$UserContextFromJson(Map<String, dynamic> json) => UserContext(
      id: json['id'] as int,
      contextName: json['contextName'] as String,
      contextColor:
          const CustomColorConverter().fromJson(json['contextColor'] as String),
    );

Map<String, dynamic> _$UserContextToJson(UserContext instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contextName': instance.contextName,
      'contextColor':
          const CustomColorConverter().toJson(instance.contextColor),
    };
