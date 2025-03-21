import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo_model.freezed.dart';
part 'memo_model.g.dart';

@freezed
class Reply with _$Reply {
  const factory Reply({
    required String id,
    required String content,
    required DateTime editDate,
  }) = _Reply;

  factory Reply.fromJson(Map<String, dynamic> json) => _$ReplyFromJson(json);
}

@freezed
class Memo with _$Memo {
  const factory Memo({
    required String id,
    required String content,
    required DateTime editDate,
    required List<Reply> replies,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
