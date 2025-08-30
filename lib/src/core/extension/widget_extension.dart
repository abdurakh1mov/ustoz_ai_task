import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension PaddingX on Widget {
  Widget get padded => Padding(padding: EdgeInsets.all(16.w), child: this);

  Widget padding([EdgeInsetsGeometry value = const EdgeInsets.all(8)]) =>
      Padding(padding: value, child: this);
}
