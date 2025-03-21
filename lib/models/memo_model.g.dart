// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReplyImpl _$$ReplyImplFromJson(Map<String, dynamic> json) => _$ReplyImpl(
  id: json['id'] as String,
  content: json['content'] as String,
  editDate: DateTime.parse(json['editDate'] as String),
);

Map<String, dynamic> _$$ReplyImplToJson(_$ReplyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'editDate': instance.editDate.toIso8601String(),
    };

_$MemoImpl _$$MemoImplFromJson(Map<String, dynamic> json) => _$MemoImpl(
  id: json['id'] as String,
  content: json['content'] as String,
  editDate: DateTime.parse(json['editDate'] as String),
  replies:
      (json['replies'] as List<dynamic>)
          .map((e) => Reply.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$MemoImplToJson(_$MemoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'editDate': instance.editDate.toIso8601String(),
      'replies': instance.replies,
    };
