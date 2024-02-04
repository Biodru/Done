// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      id: json['id'] as int,
      topic: json['topic'] as String,
      description: json['description'] as String?,
      userContextId: json['userContextId'] as int?,
      chosenColor: _$JsonConverterFromJson<String, Color>(
          json['chosenColor'], const CustomColorConverter().fromJson),
      lastEdited: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastEdited'], const CustomTimestampConverter().fromJson),
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'description': instance.description,
      'userContextId': instance.userContextId,
      'chosenColor': _$JsonConverterToJson<String, Color>(
          instance.chosenColor, const CustomColorConverter().toJson),
      'lastEdited': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastEdited, const CustomTimestampConverter().toJson),
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
