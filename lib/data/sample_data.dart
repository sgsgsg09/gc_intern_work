import 'package:gc_intern_work/models/memo_model.dart';

final List<Memo> sampleMemos = [
  Memo(
    id: "memo_1",
    content: "원장님 미팅, 다음 주 화요일 오전 10시로 일정 조율 완료했습니다.",
    editDate: DateTime.now().subtract(const Duration(hours: 2)),
    replies: [
      Reply(
        id: "reply_1",
        content: "브로셔는 오늘 인쇄 들어갑니다. 미팅 전 전달드릴게요!",
        editDate: DateTime.now().subtract(
          const Duration(hours: 1, minutes: 30),
        ),
      ),
      Reply(
        id: "reply_2",
        content: "홍보자료도 추가로 준비해두겠습니다.",
        editDate: DateTime.now().subtract(const Duration(hours: 1)),
      ),
    ],
  ),
  Memo(
    id: "memo_2",
    content: "상담실 리모델링 관련해서 인테리어 팀과 미팅 예정입니다.",
    editDate: DateTime.now().subtract(const Duration(days: 1, hours: 3)),
    replies: [
      Reply(
        id: "reply_3",
        content: "견적은 다음 주 초에 나올 예정이라고 합니다.",
        editDate: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      ),
    ],
  ),
  Memo(
    id: "memo_3",
    content: "의료기기 리스 계약 건 다시 검토 필요합니다. 법무팀 의견 기다리는 중.",
    editDate: DateTime.now().subtract(const Duration(days: 3)),
    replies: [],
  ),
];
