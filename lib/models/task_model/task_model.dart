import 'package:freezed_annotation/freezed_annotation.dart';

import '../category_model.dart';
import '../time_model/time_model.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    String? description,
    String? priority,
    CategoryModel? category,
    DateTime? date,
    TimeModel? time,
  }) = _TaskModel;
}
