import 'package:gc_intern_work/services/provider_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:gc_intern_work/services/abstract_hospital_repository.dart';
import 'package:gc_intern_work/models/models.dart';

part 'hospital_viewmodel.g.dart';

// 하나의 병원 전체를 관리하는 ViewModel
@riverpod
class HospitalViewModel extends _$HospitalViewModel {
  late final AbstractHospitalRepository _repository;
  late final String _hospitalId;

  /// build(hospitalId) 치과의원 병원 로딩
  @override
  Future<Hospital> build(String hospitalId) async {
    _hospitalId = hospitalId; // 병원 식별자.
    _repository = ref.watch(hospitalMockRepositoryProviderProvider);

    // 병원 메모 데이터 불러오기
    final hospital = await _repository.fetchHospital(_hospitalId);
    return hospital;
  }

  /// 현재 상태 Hospital 데이터를 가져옴 아닐시 null 반환.
  Hospital? get currentHospital {
    final snap = state.valueOrNull;
    return snap;
  }

  /// 병원 ID getter
  @override
  String get hospitalId => _hospitalId;

  /// 새 메모 추가
  Future<void> addComment({
    required String employeeId,
    required String content,
  }) async {
    try {
      await _repository.addComment(
        hospitalId: _hospitalId,
        employeeId: employeeId,
        content: content,
      );
      await _refreshHospital(); // 변경 후 병원 데이터 재로딩
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }

  /// 메모 수정
  Future<void> updateComment({
    required String employeeId,
    required String commentId,
    required String newContent,
  }) async {
    try {
      await _repository.updateComment(
        hospitalId: _hospitalId,
        employeeId: employeeId,
        commentId: commentId,
        newContent: newContent,
      );
      await _refreshHospital();
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }

  /// 메모 삭제
  Future<void> deleteComment({
    required String employeeId,
    required String commentId,
  }) async {
    try {
      await _repository.deleteComment(
        hospitalId: _hospitalId,
        employeeId: employeeId,
        commentId: commentId,
      );
      await _refreshHospital();
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }

  /// 답글(댓글) 추가
  Future<void> addReply({
    required String employeeId,
    required String parentCommentId,
    required String content,
  }) async {
    try {
      await _repository.addReply(
        hospitalId: _hospitalId,
        employeeId: employeeId,
        parentCommentId: parentCommentId,
        content: content,
      );
      await _refreshHospital();
    } catch (err, st) {
      state = AsyncValue.error(err, st);
    }
  }

  List<DetailedComment> get detailedComments {
    final hosp = currentHospital;
    if (hosp == null) return [];

    // 모든 직원 반복 -> 각 직원이 가진 memos를 DetailedComment 형태로 변환
    return hosp.employees.expand((emp) {
      return emp.memos.map((memo) {
        return DetailedComment(comment: memo, employee: emp);
      });
    }).toList();
  }

  /// 병원에 소속된 모든 직원 리스트 반환
  List<Employee> get employees {
    return currentHospital?.employees ?? [];
  }

  // 병원에 속한 모든 메모 및 댓글 정보를 리스트.
  List<Comment> get allComments {
    return employees.expand((e) => e.memos).toList();
  }

  /// 병원 데이터를 다시 불러와서 state를 갱신
  Future<void> _refreshHospital() async {
    final updated = await _repository.fetchHospital(_hospitalId);
    state = AsyncValue.data(updated);
  }
}

/// 메모 + 작성자(Employee) 정보를 함께 담는 모델
class DetailedComment {
  final Comment comment;
  final Employee? employee; // 혹은 항상 존재한다면 Employee

  DetailedComment({required this.comment, required this.employee});
}
