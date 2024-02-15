import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:mobx/mobx.dart';

import '../../models/category_model.dart';
import '../../models/priority_model.dart';
import '../../models/task_model/task_model.dart';
import '../../models/time_model/time_model.dart';

part 'home_state.g.dart';

class HomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  @observable
  ObservableList<TaskModel> tasks = <TaskModel>[].asObservable();

  @observable
  int currentIndex = 0;

  @observable
  Time? time;

  @observable
  String? title;

  @observable
  String? description;

  @observable
  CategoryModel? category;

  @observable
  PriorityModel? priority;

  @action
  void setCategory(CategoryModel category) => this.category = category;

  @action
  void setPriority(PriorityModel priority) => this.priority = priority;

  @action
  void clearData() {
    time = null;
    title = null;
    description = null;
    category = null;
    priority = null;
  }

  @action
  void setTime(Time time) => this.time = time;

  @action
  void createTask(DateTime date) {
    final task = TaskModel(
      id: DateTime.fromMicrosecondsSinceEpoch(1000).toIso8601String(),
      title: title!,
      description: description,
      date: date,
      category: category,
      priority: priority,
      time: TimeModel(
        hour: time?.hour != null
            ? time!.hour < 10
                ? '0${time!.hour}'
                : '${time!.hour}'
            : '',
        minute: time?.minute != null
            ? time!.minute <= 9
                ? '0${time!.minute}'
                : '${time!.minute}'
            : '',
      ),
    );
    tasks.add(task);
    clearData();
  }

  bool isToday({
    required DateTime first,
  }) {
    final now = DateTime.now().toLocal();

    return first == DateTime(now.year, now.month, now.day);
  }
}
