import 'package:gc_intern_work/models/models.dart';

abstract class AbstractHospitalRepository {
  /// 병원 전체 데이터(Hospital)를 가져온다.
  Future<Hospital> fetchHospital(String hospitalId);

  /// 새 메모(Comment) 추가 (어느 Employee 것인지 포함)
  Future<void> addComment({
    required String hospitalId,
    required String employeeId,
    required String content,
  });

  /// 메모 수정
  Future<void> updateComment({
    required String hospitalId,
    required String employeeId,
    required String commentId,
    required String newContent,
  });

  /// 메모 삭제
  Future<void> deleteComment({
    required String hospitalId,
    required String employeeId,
    required String commentId,
  });

  /// 답글 추가
  Future<void> addReply({
    required String hospitalId,
    required String employeeId,
    required String parentCommentId,
    required String content,
  });
}
