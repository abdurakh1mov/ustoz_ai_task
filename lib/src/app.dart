import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/navigator/app_router.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

import '../generated/l10n.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<LocalizationsDelegate<Object>> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    S.delegate,
  ];
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          builder: _applyMediaQuery,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.appRouter,
          localizationsDelegates: localizationsDelegates,
          supportedLocales: S.delegate.supportedLocales,
          theme: _theme,
          locale: const Locale('en'),
        );
      },
    );
  }

  ThemeData get _theme => ThemeData(
    useMaterial3: Platform.isIOS,
    brightness: Brightness.light,
    fontFamily: 'Manrope',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    scaffoldBackgroundColor: AppColors.light.white,
    primaryColor: AppColors.light.primary,
    inputDecorationTheme: null,
    extensions: <ThemeExtension<dynamic>>[AppTextStyles.light, AppColors.light],
  );

  /// Fixes system-wide text scaling to ensure consistent UI
  Widget _applyMediaQuery(BuildContext context, Widget? child) {
    final mq = MediaQuery.of(context);
    return MediaQuery(
      data: mq.copyWith(textScaler: const TextScaler.linear(1.0)),
      child: child!,
    );
  }
}
