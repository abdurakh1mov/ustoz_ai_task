import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

import '../core/utils/decoration_helper.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.hintText,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hintText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    widget.focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = widget.focusNode.hasFocus;
    return TextField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: decorationColorWithAlpha(context: context),
            width: 1.w,
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        // focusColor: ,
        hintText: widget.hintText,
        hintStyle: context.textStyles.w500f12.copyWith(
          color: decorationColorWithAlpha(context: context, alpha: .7),
        ),
        filled: true,
        fillColor: isFocused
            ? Color(0x0C182903)
            : decorationColorWithAlpha(context: context),
      ),
      style: context.textStyles.w500f14,
    );
  }
}
