import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/core/utils/decoration_helper.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.hintText,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hintText;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool _isVisible = false;
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
      obscureText: !_isVisible,
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
        suffixIcon: IconButton(
          icon: Icon(
            _isVisible ? Icons.visibility : Icons.visibility_off,
            color: context.appColors.white.withValues(alpha: 0.6),
          ),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
        ),
        hintStyle: context.textStyles.w500f12.copyWith(
          color: decorationColorWithAlpha(context: context, alpha: .7),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: isFocused
            ? Color(0x0C182903)
            : decorationColorWithAlpha(context: context),
      ),
      style: context.textStyles.w500f14,
    );
  }
}
