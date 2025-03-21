import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/models/hive_adapters/adapter.dart';
import 'package:gc_intern_work/services/hospital_hive_repository.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/views/todo_content_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HospitalAdapter());
  Hive.registerAdapter(EmployeeAdapter());
  Hive.registerAdapter(CommentAdapter());

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      home: TodoContentWidget(hospitalId: 'hospital_1'),
    );
  }
}
