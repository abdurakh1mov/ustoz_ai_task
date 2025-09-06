import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class TransactionTextField extends StatefulWidget {
  const TransactionTextField({
    super.key,
    this.inputType,
    this.formatter,
    required this.controller,
  });
  final List<TextInputFormatter>? formatter;
  final TextInputType? inputType;
  final TextEditingController controller;
  @override
  State<TransactionTextField> createState() => _TransactionTextFieldState();
}

class _TransactionTextFieldState extends State<TransactionTextField> {
  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final appColors = context.appColors;
    return TextField(
      inputFormatters: widget.formatter,
      controller: widget.controller,
      keyboardType: widget.inputType ?? TextInputType.number,
      style: textStyles.w500f12,
      autocorrect: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: appColors.white.withValues(alpha: 0.2),
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: appColors.softBlue, width: 1.w),
        ),
        hintText: "Enter amount",
        hintStyle: textStyles.w500f12.copyWith(color: appColors.silverGray),
      ),
    );
  }
}
