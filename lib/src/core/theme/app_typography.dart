import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles extends ThemeExtension<AppTextStyles> {
  const AppTextStyles({
    required this.w900f16,
    required this.w800f24,
    required this.w700f24,
    required this.w700f20,
    required this.w700f18,
    required this.w700f16,
    required this.w700f14,
    required this.w600f18,
    required this.w600f16,
    required this.w600f14,
    required this.w600f12,
    required this.w500f16,
    required this.w500f14,
    required this.w500f12,
    required this.w400f14,
    required this.w400f12,
    required this.w300f14,
  });

  final TextStyle w900f16;
  final TextStyle w800f24;
  final TextStyle w700f24;
  final TextStyle w700f20;
  final TextStyle w700f18;
  final TextStyle w700f16;
  final TextStyle w700f14;
  final TextStyle w600f18;
  final TextStyle w600f16;
  final TextStyle w600f14;
  final TextStyle w600f12;
  final TextStyle w500f16;
  final TextStyle w500f14;
  final TextStyle w500f12;
  final TextStyle w400f14;
  final TextStyle w400f12;
  final TextStyle w300f14;

  static const _fontFamilyManrope = "Manrope";
  static const Color _white = Color(0xffffffff);

  static AppTextStyles light = AppTextStyles(
    /// fontWeight-900,fontSize-16
    w900f16: TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: _fontFamilyManrope,
      fontSize: 16.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-800,fontSize-24
    w800f24: TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: _fontFamilyManrope,
      fontSize: 24.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-700,fontSize-24
    w700f24: TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamilyManrope,
      height: 1.5,
      color: _white,
      fontSize: 24.sp,
    ),

    /// fontWeight-700,fontSize-20
    w700f20: TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamilyManrope,
      fontSize: 20.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-700,fontSize-18
    w700f18: TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamilyManrope,
      fontSize: 18.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-700,fontSize-16
    w700f16: TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamilyManrope,
      height: 1.5,
      fontSize: 16.sp,
      color: _white,
    ),

    /// fontWeight-700,fontSize-14
    w700f14: TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: _fontFamilyManrope,
      fontSize: 14.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-600,fontSize-18
    w600f18: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamilyManrope,
      fontSize: 18.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-600,fontSize-16
    w600f16: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamilyManrope,
      fontSize: 16.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-600,fontSize-14
    w600f14: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamilyManrope,
      fontSize: 14.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-600,fontSize-12
    w600f12: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: _fontFamilyManrope,
      fontSize: 12.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-500,fontSize-16
    w500f16: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamilyManrope,
      fontSize: 16.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-500,fontSize-14
    w500f14: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamilyManrope,
      fontSize: 14.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-500,fontSize-12
    w500f12: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: _fontFamilyManrope,
      fontSize: 14.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-400,fontSize-14
    w400f14: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamilyManrope,
      fontSize: 14.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-400,fontSize-12
    w400f12: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: _fontFamilyManrope,
      fontSize: 12.sp,
      color: _white,
      height: 1.5,
    ),

    /// fontWeight-300,fontSize-14
    w300f14: TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: _fontFamilyManrope,
      fontSize: 14.sp,
      color: _white,
      height: 1.5,
    ),
  );

  @override
  AppTextStyles copyWith({
    TextStyle? w900f16,
    TextStyle? w800f24,
    TextStyle? w700f24,
    TextStyle? w700f18,
    TextStyle? w700f16,
    TextStyle? w600f18,
    TextStyle? w600f16,
    TextStyle? w600f14,
    TextStyle? w600f12,
    TextStyle? w500f14,
    TextStyle? w500f16,
    TextStyle? w500f12,
    TextStyle? w400f14,
    TextStyle? w300f14,
    TextStyle? w700f20,
    TextStyle? w700f14,
    TextStyle? w400f12,
  }) {
    return AppTextStyles(
      w900f16: w900f16 ?? this.w900f16,
      w800f24: w800f24 ?? this.w800f24,
      w700f24: w700f24 ?? this.w700f24,
      w700f20: w700f20 ?? this.w700f20,
      w700f18: w700f18 ?? this.w700f18,
      w700f16: w700f16 ?? this.w700f16,
      w600f18: w600f18 ?? this.w600f18,
      w600f16: w600f16 ?? this.w600f16,
      w600f14: w600f14 ?? this.w600f14,
      w600f12: w600f12 ?? this.w600f12,
      w500f16: w500f16 ?? this.w500f16,
      w500f14: w500f14 ?? this.w500f14,
      w400f14: w400f14 ?? this.w400f14,
      w300f14: w300f14 ?? this.w300f14,
      w700f14: w700f14 ?? this.w700f14,
      w400f12: w400f12 ?? this.w400f12,
      w500f12: w500f12 ?? this.w500f12,
    );
  }

  @override
  ThemeExtension<AppTextStyles> lerp(
    ThemeExtension<AppTextStyles>? other,
    double t,
  ) {
    if (other is! AppTextStyles) return this;
    return this;
  }
}

extension BuildContextX on BuildContext {
  AppTextStyles get textStyles => Theme.of(this).extension<AppTextStyles>()!;
}
