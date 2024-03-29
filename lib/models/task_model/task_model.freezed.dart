// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskModel {
  bool get isDone => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  PriorityModel? get priority => throw _privateConstructorUsedError;
  CategoryModel? get category => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  TimeModel? get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {bool isDone,
      String id,
      String title,
      String? description,
      PriorityModel? priority,
      CategoryModel? category,
      DateTime? date,
      TimeModel? time});

  $TimeModelCopyWith<$Res>? get time;
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDone = null,
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? priority = freezed,
    Object? category = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as PriorityModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeModelCopyWith<$Res>? get time {
    if (_value.time == null) {
      return null;
    }

    return $TimeModelCopyWith<$Res>(_value.time!, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDone,
      String id,
      String title,
      String? description,
      PriorityModel? priority,
      CategoryModel? category,
      DateTime? date,
      TimeModel? time});

  @override
  $TimeModelCopyWith<$Res>? get time;
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDone = null,
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? priority = freezed,
    Object? category = freezed,
    Object? date = freezed,
    Object? time = freezed,
  }) {
    return _then(_$TaskModelImpl(
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as PriorityModel?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as TimeModel?,
    ));
  }
}

/// @nodoc

class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {this.isDone = false,
      required this.id,
      required this.title,
      this.description,
      this.priority,
      this.category,
      this.date,
      this.time});

  @override
  @JsonKey()
  final bool isDone;
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final PriorityModel? priority;
  @override
  final CategoryModel? category;
  @override
  final DateTime? date;
  @override
  final TimeModel? time;

  @override
  String toString() {
    return 'TaskModel(isDone: $isDone, id: $id, title: $title, description: $description, priority: $priority, category: $category, date: $date, time: $time)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.isDone, isDone) || other.isDone == isDone) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDone, id, title, description,
      priority, category, date, time);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {final bool isDone,
      required final String id,
      required final String title,
      final String? description,
      final PriorityModel? priority,
      final CategoryModel? category,
      final DateTime? date,
      final TimeModel? time}) = _$TaskModelImpl;

  @override
  bool get isDone;
  @override
  String get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  PriorityModel? get priority;
  @override
  CategoryModel? get category;
  @override
  DateTime? get date;
  @override
  TimeModel? get time;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
