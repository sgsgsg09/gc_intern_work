import 'package:gc_intern_work/models/memo_model.dart';
import 'package:gc_intern_work/data/sample_data.dart';
import 'package:gc_intern_work/services/memo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hospital_viewmodel.g.dart';

@riverpod
class HospitalViewModel extends _$HospitalViewModel {
  late final MemoRepository _repository;

  @override
  Future<List<Memo>> build() async {
    // Repository 초기화 및 Hive Box 오픈
    _repository = MemoRepository();
    await _repository.init();

    // Hive에 저장된 메모 불러오기
    List<Memo> memos = await _repository.getMemos();

    /*    
 // 저장된 메모가 없으면 sampleMemos를 기본 데이터로 사용 및 저장
    if (memos.isEmpty) {
      memos = sampleMemos;
      for (final memo in sampleMemos) {
        await _repository.addMemo(memo);
      }
    }
 */
    return memos;
  }

  // 메모 추가
  Future<void> addMemo(Memo memo) async {
    await _repository.addMemo(memo);
    // state.value!는 현재 데이터(List<Memo>)를 나타냄
    state = AsyncValue.data([memo, ...state.value!]);
  }

  // 메모 수정 (id에 해당하는 메모를 새 Memo 객체로 교체)
  Future<void> updateMemo(String id, Memo updatedMemo) async {
    await _repository.updateMemo(updatedMemo);
    final updatedMemos =
        state.value!.map((memo) => memo.id == id ? updatedMemo : memo).toList();
    state = AsyncValue.data(updatedMemos);
  }

  // 메모 삭제
  Future<void> deleteMemo(String id) async {
    await _repository.deleteMemo(id);
    final updatedMemos = state.value!.where((memo) => memo.id != id).toList();
    state = AsyncValue.data(updatedMemos);
  }

  // 특정 메모에 답글 추가
  Future<void> addReply(String memoId, Reply reply) async {
    final updatedMemos =
        state.value!.map((memo) {
          if (memo.id == memoId) {
            final updatedMemo = memo.copyWith(
              replies: [reply, ...memo.replies],
            );
            _repository.updateMemo(updatedMemo);
            return updatedMemo;
          }
          return memo;
        }).toList();

    state = AsyncValue.data(updatedMemos);
  }

  // 특정 메모의 답글 수정 (memoId와 replyId에 해당하는 답글을 업데이트)
  Future<void> updateReply(
    String memoId,
    String replyId,
    Reply updatedReply,
  ) async {
    final updatedMemos =
        state.value!.map((memo) {
          if (memo.id == memoId) {
            final updatedReplies =
                memo.replies
                    .map((r) => r.id == replyId ? updatedReply : r)
                    .toList();
            // 메모의 수정시간도 현재 시간으로 업데이트
            final updatedMemo = memo.copyWith(
              replies: updatedReplies,
              editDate: DateTime.now(),
            );
            _repository.updateMemo(updatedMemo);
            return updatedMemo;
          }
          return memo;
        }).toList();

    // 최신순으로 정렬: 수정된 메모가 맨 위로 오도록

    updatedMemos.sort((a, b) => b.editDate.compareTo(a.editDate));

    state = AsyncValue.data(updatedMemos);
  }

  // 특정 메모의 답글 삭제
  Future<void> deleteReply(String memoId, String replyId) async {
    final updatedMemos =
        state.value!.map((memo) {
          if (memo.id == memoId) {
            final updatedReplies =
                memo.replies.where((r) => r.id != replyId).toList();
            final updatedMemo = memo.copyWith(replies: updatedReplies);
            _repository.updateMemo(updatedMemo);
            return updatedMemo;
          }
          return memo;
        }).toList();
    state = AsyncValue.data(updatedMemos);
  }
}
