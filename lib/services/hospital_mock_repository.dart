// hospital_mock_repository.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gc_intern_work/models/models.dart';
import 'package:gc_intern_work/services/abstract_hospital_repository.dart';

class HospitalMockRepository implements AbstractHospitalRepository {
  @override
  Future<Hospital> fetchHospital(String hospitalId) async {
    // JSON 파일 로딩 (비동기)
    final jsonString = await rootBundle.loadString(
      'assets/mock_data/hospital.json',
    );
    // 파싱
    final Map<String, dynamic> data = jsonDecode(jsonString);
    // 모델 변환
    final hospital = Hospital.fromJson(data);

    // (만약 hospitalId 체크가 필요하면 여기서 조건 처리)
    return hospital;
  }

  @override
  Future<void> addComment({
    required String hospitalId,
    required String employeeId,
    required String content,
  }) async {
    // TODO: mock 데이터 수정 로직 (in-memory로 들고 있거나, 재로딩 구조)
    throw UnimplementedError();
  }

  @override
  Future<void> updateComment({
    required String hospitalId,
    required String employeeId,
    required String commentId,
    required String newContent,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteComment({
    required String hospitalId,
    required String employeeId,
    required String commentId,
  }) async {
    throw UnimplementedError();
  }

  @override
  Future<void> addReply({
    required String hospitalId,
    required String employeeId,
    required String parentCommentId,
    required String content,
  }) async {
    throw UnimplementedError();
  }
}
