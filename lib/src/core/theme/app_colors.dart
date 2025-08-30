import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.yellowStar,
    required this.backgroundColor,
    required this.linear1,
    required this.linear2,
    required this.softBlue,
    required this.primary,
    required this.white,
    required this.black,
    required this.gray,
    required this.red,
    required this.graphiteBlack,
    required this.silverGray,
  });

  final Color primary;
  final Color white;
  final Color black;
  final Color gray;
  final Color red;
  final Color graphiteBlack;
  final Color silverGray;
  final Color backgroundColor;
  final Color softBlue;
  final Color linear1;
  final Color linear2;
  final Color yellowStar;

  static const light = AppColors(
    yellowStar: Color(0xffFDD412),
    softBlue: Color(0xff1A79FF),
    linear1: Color(0xff02366A),
    linear2: Color(0xff0C1829),
    backgroundColor: Color(0xff242A32),
    primary: Color(0xff4066F6),
    white: Color(0xffffffff),
    black: Color(0xff000000),
    gray: Color(0xffEDEDED),
    red: Color(0xffFA193E),
    graphiteBlack: Color(0xff1C1D20),
    silverGray: Color(0xff999999),
  );

  static const dark = AppColors(
    yellowStar: Color(0xffFDD412),
    softBlue: Color(0xff1A79FF),
    backgroundColor: Color(0xff242A32),
    primary: Color(0xff4066F6),
    linear1: Color(0xff02366A),
    linear2: Color(0xff0C1829),
    white: Color(0xffffffff),
    black: Color(0xff000000),
    gray: Color(0xff282828),
    red: Color(0xffFA193E),
    graphiteBlack: Color(0xff1C1D20),
    silverGray: Color(0xff999999),
  );

  @override
  ThemeExtension<AppColors> copyWith({
    Color? primary,
    Color? white,
    Color? black,
    Color? linear1,
    Color? linear2,
    Color? gray,
    Color? red,
    Color? graphiteBlack,
    Color? silverGray,
    Color? backgroundColor,
    Color? softBlue,
    Color? yellowStar,
  }) {
    return AppColors(
      yellowStar: yellowStar ?? this.yellowStar,
      linear1: linear1 ?? this.linear1,
      linear2: linear2 ?? this.linear2,
      softBlue: softBlue ?? this.softBlue,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      primary: primary ?? this.primary,
      white: white ?? this.white,
      black: black ?? this.black,
      gray: gray ?? this.gray,
      red: red ?? this.red,
      graphiteBlack: graphiteBlack ?? this.graphiteBlack,
      silverGray: silverGray ?? this.silverGray,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      yellowStar: Color.lerp(yellowStar, other.yellowStar, t)!,
      linear1: Color.lerp(linear1, other.linear1, t)!,
      linear2: Color.lerp(linear2, other.linear2, t)!,
      softBlue: Color.lerp(softBlue, other.softBlue, t)!,
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
      red: Color.lerp(red, other.red, t)!,
      graphiteBlack: Color.lerp(graphiteBlack, other.graphiteBlack, t)!,
      silverGray: Color.lerp(silverGray, other.silverGray, t)!,
    );
  }
}

extension BuildContextX on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}
