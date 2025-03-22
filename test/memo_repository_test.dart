import 'package:flutter_test/flutter_test.dart';
import 'package:gc_intern_work/services/memo_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gc_intern_work/models/memo_model.dart';
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  group('MemoRepository 테스트', () {
    late MemoRepository memoRepository;

    // 각 테스트 시작 전 Hive 초기화 및 repository 생성
    setUp(() async {
      // 테스트 전용 임시 디렉토리를 사용하거나 Hive.initFlutter()를 그대로 사용할 수 있음
      await Hive.initFlutter();
      memoRepository = MemoRepository();
      await memoRepository.init();
    });

    // 테스트 후 사용한 box를 삭제하여 상태 초기화
    tearDown(() async {
      await Hive.deleteBoxFromDisk('memo_box');
    });

    test('addMemo와 getMemos 테스트', () async {
      // 테스트용 Memo 생성
      final memo = Memo(
        id: '1',
        content: '이것은 테스트 메모입니다.',
        editDate: DateTime.now(),
        replies: [],
      );
      // 메모 추가
      await memoRepository.addMemo(memo);

      // 메모 가져오기
      final memos = await memoRepository.getMemos();
      // 메모가 정상적으로 추가되었는지 검증
      expect(memos.isNotEmpty, true);
      expect(memos.first.id, '1');
    });

    test('updateMemo 테스트', () async {
      // 초기 Memo 추가
      final memo = Memo(
        id: '2',
        content: '원본 내용',
        editDate: DateTime.now(),
        replies: [],
      );
      await memoRepository.addMemo(memo);

      // 메모 업데이트: 제목과 내용, 수정일 변경
      final updatedMemo = memo.copyWith(
        id: '2',
        content: '업데이트된 내용',
        editDate: DateTime.now().add(Duration(minutes: 1)),
      );
      await memoRepository.updateMemo(updatedMemo);

      // 업데이트 후 메모 가져오기
      final memos = await memoRepository.getMemos();
      final resultMemo = memos.firstWhere((m) => m.id == '2');

      expect(resultMemo.id, '2');
      expect(resultMemo.content, '업데이트된 내용');
    });

    test('deleteMemo 테스트', () async {
      // 삭제할 메모 추가
      final memo = Memo(
        id: '3',
        content: '삭제 예정입니다.',
        editDate: DateTime.now(),
        replies: [],
      );
      await memoRepository.addMemo(memo);

      // 메모 삭제
      await memoRepository.deleteMemo('3');

      // 삭제 후 메모가 없음을 검증
      final memos = await memoRepository.getMemos();
      final exists = memos.any((m) => m.id == '3');
      expect(exists, false);
    });
  });
}
