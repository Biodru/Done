import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done/core/util/json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
@CustomColorConverter()
@CustomTimestampConverter()
class Note {
  Note({
    required this.id,
    required this.topic,
    this.description,
    this.userContextId,
    this.chosenColor,
    this.lastEdited,
  });

  final int id;
  final String topic;
  final String? description;
  final int? userContextId;
  final Color? chosenColor;
  final DateTime? lastEdited;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
