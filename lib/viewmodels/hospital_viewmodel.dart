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

  /// build(hospitalId) : 최초 병원 로딩
  @override
  Future<Hospital> build(String hospitalId) async {
    _hospitalId = hospitalId; // 병원 식별자 저장
    _repository = ref.watch(hospitalMockRepositoryProviderProvider);
    // ↑ 실제 구현체 (ex: 서버통신 / MockRepository) 주입받음

    // 병원 데이터 불러오기
    final hospital = await _repository.fetchHospital(_hospitalId);
    return hospital;
  }

  // --------------------------------------------------------------------------
  // 병원 정보 접근 메서드들
  // --------------------------------------------------------------------------

  /// 현재 상태(AsyncValue<Hospital>)에서 Hospital 객체를 가져옴
  Hospital? get currentHospital {
    final snap = state.valueOrNull;
    return snap;
  }

  /// 병원 ID getter
  String get hospitalId => _hospitalId;

  // --------------------------------------------------------------------------
  // 메모 관련 CRUD
  // --------------------------------------------------------------------------

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

  // --------------------------------------------------------------------------
  // 사원 목록 / 메모 목록에 접근할 수 있는 편의 메서드 (선택사항)
  // --------------------------------------------------------------------------

  /// 병원에 소속된 모든 직원 리스트 반환
  List<Employee> get employees {
    return currentHospital?.employees ?? [];
  }

  /// 특정 직원의 메모 리스트를 얻어올 수 있는 메서드
  List<Comment> getMemosOfEmployee(String employeeId) {
    final emp = employees.firstWhere(
      (e) => e.id == employeeId,
      orElse: () => throw Exception('Employee not found: $employeeId'),
    );
    return emp.memos;
  }

  /// 병원 전체(모든 직원)의 메모를 하나로 합쳐서 보고 싶다면
  List<Comment> get allComments {
    return employees.expand((e) => e.memos).toList();
  }

  // --------------------------------------------------------------------------
  // 내부 도우미
  // --------------------------------------------------------------------------

  /// 병원 데이터를 다시 불러와서 state를 갱신
  Future<void> _refreshHospital() async {
    final updated = await _repository.fetchHospital(_hospitalId);
    state = AsyncValue.data(updated);
  }
}
