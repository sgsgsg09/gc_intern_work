// 파일명: hospital_viewmodel.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hospital_viewmodel.g.dart';

// 답글 모델 (Reply)
class Reply {
  final String id;
  final String content;
  final DateTime editDate;

  Reply({required this.id, required this.content, required this.editDate});

  factory Reply.fromJson(Map<String, dynamic> json) {
    return Reply(
      id: json['id'] as String,
      content: json['content'] as String,
      editDate: DateTime.parse(json['editDate'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'editDate': editDate.toIso8601String(),
  };
}

// 메모 모델 (Memo)
class Memo {
  final String id;
  final String content;
  final DateTime editDate;
  final List<Reply> replies;

  Memo({
    required this.id,
    required this.content,
    required this.editDate,
    required this.replies,
  });

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      id: json['id'] as String,
      content: json['content'] as String,
      editDate: DateTime.parse(json['editDate'] as String),
      replies:
          (json['replies'] as List<dynamic>)
              .map((reply) => Reply.fromJson(reply as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'content': content,
    'editDate': editDate.toIso8601String(),
    'replies': replies.map((reply) => reply.toJson()).toList(),
  };
}

// Riverpod을 활용한 HospitalViewModel
@riverpod
class HospitalViewModel extends _$HospitalViewModel {
  @override
  List<Memo> build() {
    return [
      Memo(
        id: "memo_1",
        content: "원장님 미팅, 다음 주 화요일 오전 10시로 일정 조율 완료했습니다.",
        editDate: DateTime.now().subtract(Duration(hours: 2)),
        replies: [
          Reply(
            id: "reply_1",
            content: "브로셔는 오늘 인쇄 들어갑니다. 미팅 전 전달드릴게요!",
            editDate: DateTime.now().subtract(Duration(hours: 1, minutes: 30)),
          ),
          Reply(
            id: "reply_2",
            content: "홍보자료도 추가로 준비해두겠습니다.",
            editDate: DateTime.now().subtract(Duration(hours: 1)),
          ),
        ],
      ),
      Memo(
        id: "memo_2",
        content: "상담실 리모델링 관련해서 인테리어 팀과 미팅 예정입니다.",
        editDate: DateTime.now().subtract(Duration(days: 1, hours: 3)),
        replies: [
          Reply(
            id: "reply_3",
            content: "견적은 다음 주 초에 나올 예정이라고 합니다.",
            editDate: DateTime.now().subtract(Duration(days: 1, hours: 2)),
          ),
        ],
      ),
      Memo(
        id: "memo_3",
        content: "의료기기 리스 계약 건 다시 검토 필요합니다. 법무팀 의견 기다리는 중.",
        editDate: DateTime.now().subtract(Duration(days: 3)),
        replies: [],
      ),
    ];
  }

  // 필요한 경우 메모 추가, 수정, 삭제 등의 메서드들을 추가할 수 있습니다.
}
