import 'dart:developer';

import 'package:day_night_time_picker/lib/state/time.dart';
import 'package:mobx/mobx.dart';

import '../../models/category_model.dart';
import '../../models/priority_model.dart';
import '../../models/task_model/task_model.dart';
import '../../models/time_model/time_model.dart';
import '../../themes/app_colors.dart';

part 'home_state.g.dart';

class HomeState extends THomeState {
  static final HomeState _singleton = HomeState._internal();
  factory HomeState() {
    return _singleton;
  }

  HomeState._internal();
}

class THomeState = _HomeState with _$HomeState;

abstract class _HomeState with Store {
  _HomeState() {
    foundTask = tasks.toList().asObservable();
    eachDayTasks = tasks.toList().asObservable();
    completedTasks = tasks.toList().asObservable();
  }

  @observable
  ObservableList<TaskModel> foundTask = <TaskModel>[].asObservable();

  @observable
  ObservableList<TaskModel> eachDayTasks = <TaskModel>[].asObservable();

  @observable
  ObservableList<TaskModel> completedTasks = <TaskModel>[].asObservable();

  @observable
  ObservableList<TaskModel> tasks = <TaskModel>[
    TaskModel(
      id: '1',
      title: 'Test 1',
      category: CategoryModel(
        color: AppColors.purple,
        iconPath: 'assets/icons/category_icons/design.svg',
        title: 'Test 1',
      ),
      priority: PriorityModel(
        priorityNumber: 15,
        iconPath: 'assets/icons/task_flag.svg',
      ),
      date: DateTime(2024, 2, 27),
      time: const TimeModel(minute: '15', hour: '13'),
      description: 'None',
    ),
    TaskModel(
      id: '2',
      title: 'Test 2',
      category: CategoryModel(
        color: AppColors.purple,
        iconPath: 'assets/icons/category_icons/design.svg',
        title: 'Test 2',
      ),
      priority: PriorityModel(
        priorityNumber: 15,
        iconPath: 'assets/icons/task_flag.svg',
      ),
      date: DateTime(2024, 2, 27),
      time: const TimeModel(minute: '15', hour: '13'),
      description: 'None',
    ),
    TaskModel(
      id: '3',
      title: 'Test 3',
      category: CategoryModel(
        color: AppColors.purple,
        iconPath: 'assets/icons/category_icons/design.svg',
        title: 'Test 3',
      ),
      priority: PriorityModel(
        priorityNumber: 15,
        iconPath: 'assets/icons/task_flag.svg',
      ),
      date: DateTime(2024, 2, 29),
      time: const TimeModel(minute: '15', hour: '13'),
      description: 'None',
    ),
  ].asObservable();

  @observable
  int currentIndex = 0;

  @observable
  DateTime searchDate = DateTime.now();

  @observable
  bool? isTodaySelected = true;

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
  void toggleIsToday(bool? isToday) {
    isTodaySelected = isToday;
  }

  @action
  void toggleIsDone(int index) {
    tasks = List<TaskModel>.generate(tasks.length, (i) {
      final task = tasks[i];
      if (i == index) {
        return task.copyWith(isDone: !task.isDone);
      }
      return task;
    }).asObservable();
  }

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
  void createTask(DateTime? date) {
    final todayDate = DateTime.now().toLocal();

    date ??= isToday(first: todayDate)
        ? todayDate
        : DateTime(todayDate.year, todayDate.month, todayDate.day);

    final task = TaskModel(
      id: DateTime.fromMicrosecondsSinceEpoch(1000).toIso8601String(),
      // ignore: use_if_null_to_convert_nulls_to_bools
      title: title?.isNotEmpty == true ? title! : 'Untitled',
      description: description ?? 'None',
      date: date,
      category: category ??
          CategoryModel(
            color: AppColors.blue,
            iconPath: 'assets/icons/category_icons/other.svg',
            title: 'None',
          ),
      priority: priority ??
          PriorityModel(
            priorityNumber: 666,
            iconPath: 'assets/icons/task_flag.svg',
          ),
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
    foundTask = tasks.toList().asObservable();
    clearData();
  }

  @action
  void editTask(TaskModel task) {
    tasks = tasks
        .map((element) {
          if (element.id == task.id) {
            return task;
          }
          return element;
        })
        .toList()
        .asObservable();
    foundTask = tasks.toList().asObservable();
  }

  @action
  void deleteTask(TaskModel task) {
    log(tasks.length.toString());
    tasks.remove(task);
    foundTask = tasks.toList().asObservable();
  }

  @action
  void repeatTask(TaskModel originalTask) {
    final repeatedTask = TaskModel(
      id: DateTime.fromMicrosecondsSinceEpoch(1000).toIso8601String(),
      title: originalTask.title,
      description: originalTask.description,
      category: originalTask.category,
      priority: originalTask.priority,
      time: originalTask.time,
      date: originalTask.date?.add(const Duration(days: 1)),
    );
    deleteTask(originalTask);

    tasks.add(repeatedTask);
    foundTask = tasks.toList().asObservable();
  }

  @action
  void runFilter(String searchingItem) {
    foundTask = searchingItem.isEmpty
        ? tasks.toList().asObservable()
        : tasks
            .where(
              (task) => task.title
                  .toLowerCase()
                  .contains(searchingItem.toLowerCase()),
            )
            .toList()
            .asObservable();
  }

  @action
  void dateFilter() {
    foundTask = tasks
        .where(
          (task) =>
              task.date != null &&
              task.date!.year == searchDate.year &&
              (task.isDone == isTodaySelected ?? false) &&
              task.date!.month == searchDate.month &&
              task.date!.day == searchDate.day,
        )
        .toList()
        .asObservable();
    log(foundTask.length.toString());
  }

  bool isToday({
    required DateTime first,
  }) {
    final now = DateTime.now().toLocal();

    return first == DateTime(now.year, now.month, now.day);
  }
}
