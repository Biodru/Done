import 'package:done/core/util/json_converters.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_context.g.dart';

@JsonSerializable()
@CustomColorConverter()
class UserContext {
  int id;
  String contextName;
  Color contextColor;

  UserContext({
    required this.id,
    required this.contextName,
    required this.contextColor,
  });

  factory UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(json);

  Map<String, dynamic> toJson() => _$UserContextToJson(this);
}
