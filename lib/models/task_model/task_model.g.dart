// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      priority: json['priority'] as String?,
      category: json['category'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time: json['time'] == null
          ? null
          : TimeModel.fromJson(json['time'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'priority': instance.priority,
      'category': instance.category,
      'date': instance.date?.toIso8601String(),
      'time': instance.time,
    };
