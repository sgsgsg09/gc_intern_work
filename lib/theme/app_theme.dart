import 'package:flutter/material.dart';
import 'app_palette.dart';

/// 전체 테마 및 텍스트 스타일 모음
class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: AppPalette.primaryColor,
      scaffoldBackgroundColor: AppPalette.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white, // AppBar 글자/아이콘 색
        centerTitle: true,
      ),

      // 텍스트 테마는 필요에 따라 세분화하여 지정
      textTheme: TextTheme(
        // 예시로 몇 가지만 지정
        bodyMedium: TextStyle(fontSize: 14, color: AppPalette.blackColor),
        bodyLarge: TextStyle(fontSize: 16, color: AppPalette.black87Color),
      ),

      tabBarTheme: TabBarTheme(
        labelColor: Colors.black,
        labelStyle: boldText16,
        unselectedLabelStyle: boldText16,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.black,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0, // 원하는 두께
          ),
        ),
        dividerHeight: 3,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppPalette.primaryColor,
        elevation: 3,
        extendedPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),

      dialogTheme: DialogThemeData(
        actionsPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),

        backgroundColor: Colors.white,
        titleTextStyle: boldGreyText16,
      ),
    );
  }

  /// 자주 쓰는 텍스트 스타일 예시
  static const TextStyle boldText20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle boldText16 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static const TextStyle boldText14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle boldGreyText16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppPalette.textgreyColor,
  );
  static const TextStyle normalText16 = TextStyle(
    fontSize: 14,
    color: AppPalette.textgreyColor,
  );
  static const TextStyle normalText14 = TextStyle(
    fontSize: 14,
    color: AppPalette.textgreyColor,
  );

  static const TextStyle greyText14 = TextStyle(
    fontSize: 14,
    color: AppPalette.greyColor,
  );

  static const TextStyle textgreyColor15 = TextStyle(
    fontSize: 15,
    color: AppPalette.textgreyColor,
  );

  static const TextStyle fabTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle alertTextStyleComplete = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle alertTextStyleCancel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppPalette.greyColor,
  );
  static const TextStyle greyActionText = TextStyle(
    color: AppPalette.greyColor,
  );
}
