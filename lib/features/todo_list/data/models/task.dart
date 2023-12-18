import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done/core/util/json_converters.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
@CustomColorConverter()
@CustomTimestampConverter()
@CustomPriorityConverter()
class Task {
  Task({
    required this.id,
    this.title,
    this.userContextId,
    this.chosenColor,
    this.date,
    this.priority,
    this.isDone = false,
  });

  final int id;
  final String? title;
  final int? userContextId;
  final Color? chosenColor;
  final DateTime? date;
  final TaskPriority? priority;
  bool isDone;
  Task copyWith(
          {int? id,
          String? title,
          int? userContextId,
          Color? chosenColor,
          DateTime? date,
          TaskPriority? priority,
          bool? isDone}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        userContextId: userContextId ?? this.userContextId,
        chosenColor: chosenColor ?? this.chosenColor,
        date: date ?? this.date,
        priority: priority ?? this.priority,
        isDone: isDone ?? this.isDone,
      );

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

enum TaskPriority { low, medium, high }
