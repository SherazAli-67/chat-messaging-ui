import 'package:chat_messaging_ui/constants/string_const.dart';
import 'package:chat_messaging_ui/core/app_colors.dart';
import 'package:chat_messaging_ui/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: StringConst.appTitle,
      theme: ThemeData(
        brightness: .light,
        fontFamily: StringConst.appFontFamily,
        scaffoldBackgroundColor: AppColors.whiteColor,
        colorScheme: ColorScheme.light(
          primary: AppColors.neutral1000Color,
          onPrimary: AppColors.neutral100Color,
          surface: AppColors.whiteColor,
          onSurface: AppColors.neutral1000Color,
          error: AppColors.errorColor,
        ),
      ),
      builder: (ctx, child) => child!,
      routerConfig: router,
    );
  }
}
