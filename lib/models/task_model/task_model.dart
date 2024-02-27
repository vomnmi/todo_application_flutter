import 'package:freezed_annotation/freezed_annotation.dart';

import '../category_model.dart';
import '../priority_model.dart';
import '../time_model/time_model.dart';

part 'task_model.freezed.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    @Default(false) bool isDone,
    required String id,
    required String title,
    String? description,
    PriorityModel? priority,
    CategoryModel? category,
    DateTime? date,
    TimeModel? time,
  }) = _TaskModel;
}

extension IsToday on TaskModel {
  bool get getIsToday {
    final now = DateTime.now().toLocal();

    return date == DateTime(now.year, now.month, now.day);
  }
}
