import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/services/hospital_hive_repository.dart';
import 'package:gc_intern_work/services/hospital_mock_repository.dart';

import 'package:gc_intern_work/services/abstract_hospital_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider_repository.g.dart';

@Riverpod(keepAlive: true)
AbstractHospitalRepository hospitalMockRepositoryProvider(Ref ref) {
  return HospitalMockRepository();
  // return HospitalHiveRepository();
}
