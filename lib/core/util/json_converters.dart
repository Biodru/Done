import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:done/core/util/color_formatter.dart';
import 'package:done/features/todo_list/data/models/task.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomColorConverter implements JsonConverter<Color, String> {
  const CustomColorConverter();

  @override
  Color fromJson(String json) {
    return json.toColor();
  }

  @override
  String toJson(Color object) {
    return '#${object.value.toRadixString(16)}';
  }
}

class CustomTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const CustomTimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime object) {
    return Timestamp.fromDate(object);
  }
}

class CustomPriorityConverter implements JsonConverter<TaskPriority, int> {
  const CustomPriorityConverter();

  @override
  TaskPriority fromJson(int json) {
    switch (json) {
      case 0:
        return TaskPriority.low;
      case 1:
        return TaskPriority.medium;
      default:
        return TaskPriority.high;
    }
  }

  @override
  int toJson(TaskPriority object) {
    switch (object) {
      case TaskPriority.low:
        return 0;
      case TaskPriority.medium:
        return 1;
      default:
        return 2;
    }
  }
}
