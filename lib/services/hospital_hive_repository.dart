import 'package:gc_intern_work/services/abstract_hospital_repository.dart';
import 'package:gc_intern_work/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class HospitalHiveRepository implements AbstractHospitalRepository {
  late Box<Hospital> _hospitalBox;

  /// Hive 박스를 초기화하고 인스턴스를 반환합니다.
  static Future<HospitalHiveRepository> init() async {
    // 앱 시작 시 Hive.initFlutter()와 타입 어댑터 등록이 완료되어야 합니다.
    final box = await Hive.openBox<Hospital>('hospitals');
    return HospitalHiveRepository._(box);
  }

  HospitalHiveRepository._(this._hospitalBox);

  @override
  Future<Hospital> fetchHospital(String hospitalId) async {
    final hospital = _hospitalBox.get(hospitalId);
    if (hospital == null) {
      throw Exception('ID가 $hospitalId 인 병원을 찾을 수 없습니다.');
    }
    return hospital;
  }

  @override
  Future<void> addComment({
    required String hospitalId,
    required String employeeId,
    required String content,
  }) async {
    final hospital = _hospitalBox.get(hospitalId);
    if (hospital == null) {
      throw Exception('ID가 $hospitalId 인 병원을 찾을 수 없습니다.');
    }

    // 해당 직원 찾기
    final employeeIndex = hospital.employees.indexWhere(
      (e) => e.id == employeeId,
    );
    if (employeeIndex == -1) {
      throw Exception('ID가 $employeeId 인 직원을 찾을 수 없습니다.');
    }

    // 새 Comment 생성
    final newComment = Comment(
      id: const Uuid().v4(),
      content: content,
      editDate: DateTime.now(),
      replies: [],
    );

    // 해당 직원의 memos에 새 댓글 추가
    final updatedEmployee = hospital.employees[employeeIndex].copyWith(
      memos: [...hospital.employees[employeeIndex].memos, newComment],
    );

    // 직원 리스트 업데이트
    final updatedEmployees = List<Employee>.from(hospital.employees);
    updatedEmployees[employeeIndex] = updatedEmployee;

    // 업데이트된 병원 정보 저장
    final updatedHospital = hospital.copyWith(employees: updatedEmployees);
    await _hospitalBox.put(hospitalId, updatedHospital);
  }

  @override
  Future<void> updateComment({
    required String hospitalId,
    required String employeeId,
    required String commentId,
    required String newContent,
  }) async {
    final hospital = _hospitalBox.get(hospitalId);
    if (hospital == null) {
      throw Exception('ID가 $hospitalId 인 병원을 찾을 수 없습니다.');
    }

    // 해당 직원 찾기
    final employeeIndex = hospital.employees.indexWhere(
      (e) => e.id == employeeId,
    );
    if (employeeIndex == -1) {
      throw Exception('ID가 $employeeId 인 직원을 찾을 수 없습니다.');
    }

    final employee = hospital.employees[employeeIndex];
    final commentIndex = employee.memos.indexWhere((c) => c.id == commentId);
    if (commentIndex == -1) {
      throw Exception('ID가 $commentId 인 댓글을 찾을 수 없습니다.');
    }

    // 댓글 업데이트 (내용과 수정 시간을 갱신)
    final updatedComment = employee.memos[commentIndex].copyWith(
      content: newContent,
      editDate: DateTime.now(),
    );

    final updatedMemos = List<Comment>.from(employee.memos);
    updatedMemos[commentIndex] = updatedComment;

    // 해당 직원 업데이트
    final updatedEmployee = employee.copyWith(memos: updatedMemos);
    final updatedEmployees = List<Employee>.from(hospital.employees);
    updatedEmployees[employeeIndex] = updatedEmployee;

    // 업데이트된 병원 정보 저장
    final updatedHospital = hospital.copyWith(employees: updatedEmployees);
    await _hospitalBox.put(hospitalId, updatedHospital);
  }

  @override
  Future<void> deleteComment({
    required String hospitalId,
    required String employeeId,
    required String commentId,
  }) async {
    final hospital = _hospitalBox.get(hospitalId);
    if (hospital == null) {
      throw Exception('ID가 $hospitalId 인 병원을 찾을 수 없습니다.');
    }

    // 해당 직원 찾기
    final employeeIndex = hospital.employees.indexWhere(
      (e) => e.id == employeeId,
    );
    if (employeeIndex == -1) {
      throw Exception('ID가 $employeeId 인 직원을 찾을 수 없습니다.');
    }

    final employee = hospital.employees[employeeIndex];
    // 해당 댓글을 리스트에서 제거
    final updatedMemos =
        employee.memos.where((c) => c.id != commentId).toList();

    // 업데이트된 직원 생성
    final updatedEmployee = employee.copyWith(memos: updatedMemos);
    final updatedEmployees = List<Employee>.from(hospital.employees);
    updatedEmployees[employeeIndex] = updatedEmployee;

    // 업데이트된 병원 정보 저장
    final updatedHospital = hospital.copyWith(employees: updatedEmployees);
    await _hospitalBox.put(hospitalId, updatedHospital);
  }

  @override
  Future<void> addReply({
    required String hospitalId,
    required String employeeId,
    required String parentCommentId,
    required String content,
  }) async {
    final hospital = _hospitalBox.get(hospitalId);
    if (hospital == null) {
      throw Exception('ID가 $hospitalId 인 병원을 찾을 수 없습니다.');
    }

    // 해당 직원 찾기
    final employeeIndex = hospital.employees.indexWhere(
      (e) => e.id == employeeId,
    );
    if (employeeIndex == -1) {
      throw Exception('ID가 $employeeId 인 직원을 찾을 수 없습니다.');
    }

    final employee = hospital.employees[employeeIndex];
    final commentIndex = employee.memos.indexWhere(
      (c) => c.id == parentCommentId,
    );
    if (commentIndex == -1) {
      throw Exception('ID가 $parentCommentId 인 부모 댓글을 찾을 수 없습니다.');
    }

    final parentComment = employee.memos[commentIndex];

    // 새 답글 생성
    final newReply = Comment(
      id: const Uuid().v4(),
      content: content,
      editDate: DateTime.now(),
      replies: [],
    );

    // 부모 댓글의 replies 업데이트
    final updatedReplies = List<Comment>.from(parentComment.replies)
      ..add(newReply);
    final updatedParentComment = parentComment.copyWith(
      replies: updatedReplies,
    );

    // 해당 직원의 memos 리스트 업데이트
    final updatedMemos = List<Comment>.from(employee.memos);
    updatedMemos[commentIndex] = updatedParentComment;

    final updatedEmployee = employee.copyWith(memos: updatedMemos);
    final updatedEmployees = List<Employee>.from(hospital.employees);
    updatedEmployees[employeeIndex] = updatedEmployee;

    // 업데이트된 병원 정보 저장
    final updatedHospital = hospital.copyWith(employees: updatedEmployees);
    await _hospitalBox.put(hospitalId, updatedHospital);
  }
}
