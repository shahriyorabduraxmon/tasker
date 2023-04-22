// To parse this JSON data, do
//
//     final taskModel = taskModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'task_model.g.dart';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class TaskModel {
  TaskModel({
    this.title,
    this.type,
    this.status,
    this.date,
    this.day,
  });

  @HiveField(1)
  String? title;
  @HiveField(2)
  String? type;
  @HiveField(3)
  bool? status;
  @HiveField(4)
  String? date;
  @HiveField(5)
  String? day;

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
    title: json["title"],
    type: json["type"],
    status: json["status"],
    date: json["date"],
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "type": type,
    "status": status,
    "date": date,
    "day": day,
  };
}
