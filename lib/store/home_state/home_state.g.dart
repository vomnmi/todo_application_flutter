// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
  late final _$foundTaskAtom =
      Atom(name: '_HomeState.foundTask', context: context);

  @override
  ObservableList<TaskModel> get foundTask {
    _$foundTaskAtom.reportRead();
    return super.foundTask;
  }

  @override
  set foundTask(ObservableList<TaskModel> value) {
    _$foundTaskAtom.reportWrite(value, super.foundTask, () {
      super.foundTask = value;
    });
  }

  late final _$eachDayTasksAtom =
      Atom(name: '_HomeState.eachDayTasks', context: context);

  @override
  ObservableList<TaskModel> get eachDayTasks {
    _$eachDayTasksAtom.reportRead();
    return super.eachDayTasks;
  }

  @override
  set eachDayTasks(ObservableList<TaskModel> value) {
    _$eachDayTasksAtom.reportWrite(value, super.eachDayTasks, () {
      super.eachDayTasks = value;
    });
  }

  late final _$completedTasksAtom =
      Atom(name: '_HomeState.completedTasks', context: context);

  @override
  ObservableList<TaskModel> get completedTasks {
    _$completedTasksAtom.reportRead();
    return super.completedTasks;
  }

  @override
  set completedTasks(ObservableList<TaskModel> value) {
    _$completedTasksAtom.reportWrite(value, super.completedTasks, () {
      super.completedTasks = value;
    });
  }

  late final _$tasksAtom = Atom(name: '_HomeState.tasks', context: context);

  @override
  ObservableList<TaskModel> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskModel> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_HomeState.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$searchDateAtom =
      Atom(name: '_HomeState.searchDate', context: context);

  @override
  DateTime get searchDate {
    _$searchDateAtom.reportRead();
    return super.searchDate;
  }

  @override
  set searchDate(DateTime value) {
    _$searchDateAtom.reportWrite(value, super.searchDate, () {
      super.searchDate = value;
    });
  }

  late final _$isTodaySelectedAtom =
      Atom(name: '_HomeState.isTodaySelected', context: context);

  @override
  bool? get isTodaySelected {
    _$isTodaySelectedAtom.reportRead();
    return super.isTodaySelected;
  }

  @override
  set isTodaySelected(bool? value) {
    _$isTodaySelectedAtom.reportWrite(value, super.isTodaySelected, () {
      super.isTodaySelected = value;
    });
  }

  late final _$timeAtom = Atom(name: '_HomeState.time', context: context);

  @override
  Time? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(Time? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$titleAtom = Atom(name: '_HomeState.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_HomeState.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: '_HomeState.category', context: context);

  @override
  CategoryModel? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(CategoryModel? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$priorityAtom =
      Atom(name: '_HomeState.priority', context: context);

  @override
  PriorityModel? get priority {
    _$priorityAtom.reportRead();
    return super.priority;
  }

  @override
  set priority(PriorityModel? value) {
    _$priorityAtom.reportWrite(value, super.priority, () {
      super.priority = value;
    });
  }

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

  @override
  void toggleIsToday(bool? isToday) {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.toggleIsToday');
    try {
      return super.toggleIsToday(isToday);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsDone(int index) {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.toggleIsDone');
    try {
      return super.toggleIsDone(index);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(CategoryModel category) {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.setCategory');
    try {
      return super.setCategory(category);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPriority(PriorityModel priority) {
    final _$actionInfo = _$_HomeStateActionController.startAction(
        name: '_HomeState.setPriority');
    try {
      return super.setPriority(priority);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearData() {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.clearData');
    try {
      return super.clearData();
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTime(Time time) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.setTime');
    try {
      return super.setTime(time);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void createTask(DateTime? date) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.createTask');
    try {
      return super.createTask(date);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTask(TaskModel task) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.editTask');
    try {
      return super.editTask(task);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask(TaskModel task) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.deleteTask');
    try {
      return super.deleteTask(task);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void repeatTask(TaskModel originalTask) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.repeatTask');
    try {
      return super.repeatTask(originalTask);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void runFilter(String searchingItem) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.runFilter');
    try {
      return super.runFilter(searchingItem);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void dateFilter() {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.dateFilter');
    try {
      return super.dateFilter();
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foundTask: ${foundTask},
eachDayTasks: ${eachDayTasks},
completedTasks: ${completedTasks},
tasks: ${tasks},
currentIndex: ${currentIndex},
searchDate: ${searchDate},
isTodaySelected: ${isTodaySelected},
time: ${time},
title: ${title},
description: ${description},
category: ${category},
priority: ${priority}
    ''';
  }
}
