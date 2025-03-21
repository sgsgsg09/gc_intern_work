import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gc_intern_work/models/memo_model.dart';

class MemoRepository {
  static const String _boxName = 'memo_box';
  late Box<String> _box;

  /// 초기화: 앱 시작 시 한번 호출하여 Hive 초기화 및 box 오픈
  Future<void> init() async {
    // hive_flutter를 사용하면 Flutter 관련 초기화가 진행됨
    await Hive.initFlutter();
    // 문자열로 저장할 것이므로 Box<String>으로 열기
    _box = await Hive.openBox<String>(_boxName);
  }

  /// 모든 Memo를 불러옵니다.
  Future<List<Memo>> getMemos() async {
    final memos =
        _box.values.map((jsonString) {
          final memo = Memo.fromJson(json.decode(jsonString));

          // 각 메모의 답글 정렬.
          final sortedReplies = [...memo.replies] // 복사본
          ..sort((a, b) => b.editDate.compareTo(a.editDate)); // 최신순

          return memo.copyWith(replies: sortedReplies);
        }).toList();

    //메모 정렬
    memos.sort((a, b) => b.editDate.compareTo(a.editDate));

    return memos;
  }

  /// 새로운 Memo를 추가합니다.
  Future<void> addMemo(Memo memo) async {
    final jsonString = json.encode(memo.toJson());
    await _box.put(memo.id, jsonString);
  }

  /// 기존 Memo를 업데이트합니다.
  Future<void> updateMemo(Memo memo) async {
    final jsonString = json.encode(memo.toJson());
    await _box.put(memo.id, jsonString);
  }

  /// Memo를 삭제합니다.
  Future<void> deleteMemo(String id) async {
    await _box.delete(id);
  }
}
