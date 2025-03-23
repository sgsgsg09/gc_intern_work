import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gc_intern_work/theme/app_theme.dart';
import 'package:gc_intern_work/views/todo_content_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  // Hive 열기 및 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('memo_box');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.theme, home: TodoContentWidget());
  }
}
