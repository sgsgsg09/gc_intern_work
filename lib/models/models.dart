import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class Hospital with _$Hospital {
  const factory Hospital({
    required String id,
    required String name,
    required String location,

    /// 병원 소속 사원들의 리스트
    required List<Employee> employees,
  }) = _Hospital;

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}

@freezed
class Employee with _$Employee {
  const factory Employee({
    required String id,
    required String jobTitle,
    required String workplace,

    // 사원이 작성한 메모(댓글)의 리스트
    required List<Comment> memos,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String id,
    required String content,
    required DateTime editDate,
    // 메모에 달린 답글(댓글). (없을 경우 빈 리스트 반환)
    @Default([]) List<Comment> replies,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
