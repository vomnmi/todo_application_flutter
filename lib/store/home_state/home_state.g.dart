// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeState on _HomeState, Store {
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

  late final _$_HomeStateActionController =
      ActionController(name: '_HomeState', context: context);

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
  void createTask(DateTime date) {
    final _$actionInfo =
        _$_HomeStateActionController.startAction(name: '_HomeState.createTask');
    try {
      return super.createTask(date);
    } finally {
      _$_HomeStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
    tasks: ${tasks},
    currentIndex: ${currentIndex},
    time: ${time}
    ''';
  }
}
