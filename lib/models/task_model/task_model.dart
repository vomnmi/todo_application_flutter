import 'package:freezed_annotation/freezed_annotation.dart';

import '../time_model/time_model.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    String? description,
    String? priority,
    String? category,
    DateTime? date,
    TimeModel? time,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
