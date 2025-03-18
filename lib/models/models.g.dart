// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HospitalImpl _$$HospitalImplFromJson(Map<String, dynamic> json) =>
    _$HospitalImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      employees:
          (json['employees'] as List<dynamic>)
              .map((e) => Employee.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$HospitalImplToJson(_$HospitalImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'employees': instance.employees,
    };

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      id: json['id'] as String,
      jobTitle: json['jobTitle'] as String,
      workplace: json['workplace'] as String,
      memos:
          (json['memos'] as List<dynamic>)
              .map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobTitle': instance.jobTitle,
      'workplace': instance.workplace,
      'memos': instance.memos,
    };

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      editDate: DateTime.parse(json['editDate'] as String),
      replies:
          (json['replies'] as List<dynamic>?)
              ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'editDate': instance.editDate.toIso8601String(),
      'replies': instance.replies,
    };
