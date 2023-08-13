// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int,
      title: json['title'] as String?,
      userContextId: json['userContextId'] as int?,
      chosenColor: _$JsonConverterFromJson<String, Color>(
          json['chosenColor'], const CustomColorConverter().fromJson),
      date: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['date'], const CustomTimestampConverter().fromJson),
      priority: _$JsonConverterFromJson<int, TaskPriority>(
          json['priority'], const CustomPriorityConverter().fromJson),
      isDone: json['isDone'] as bool? ?? false,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userContextId': instance.userContextId,
      'chosenColor': _$JsonConverterToJson<String, Color>(
          instance.chosenColor, const CustomColorConverter().toJson),
      'date': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.date, const CustomTimestampConverter().toJson),
      'priority': _$JsonConverterToJson<int, TaskPriority>(
          instance.priority, const CustomPriorityConverter().toJson),
      'isDone': instance.isDone,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
