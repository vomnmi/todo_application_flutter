import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:mobx/mobx.dart';

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
  String? category;

  @observable
  String? priority;

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
      title: 'title',
      date: date,
      time: TimeModel(
        minute: time?.second ?? 0,
        hour: time?.hour ?? 0,
      ),
    );
    tasks.add(task);
    clearData();
  }
}
