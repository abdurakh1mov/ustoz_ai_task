import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/animation_button_effect.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.isDisabled = false,
    this.title,
    this.titleColor = const Color(0xffFFFFFF),
    this.backgroundColor,
    this.borderWidth = 0.5,
    this.verticalPadding = 12,
    this.isLoading,
    this.icon,
  });

  final VoidCallback onPressed;
  final Color? backgroundColor;
  final String? title;
  final Color titleColor;
  final bool isDisabled;
  final double borderWidth;
  final double verticalPadding;
  final bool? isLoading;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final color = context.appColors;

    return AnimationButtonEffect(
      disabled: isDisabled,
      onTap: onPressed,
      isLoading: isLoading ?? false,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: (isDisabled)
              ? color.silverGray
              : (backgroundColor == null)
              ? color.softBlue
              : backgroundColor,
          boxShadow: isDisabled
              ? null
              : [
                  BoxShadow(
                    color: color.black.withValues(alpha: 0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 4.r,
                  ),
                ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding.h,
            horizontal: 8.w,
          ),
          child: title == null
              ? Icon(icon)
              : (isLoading ?? false)
              ? Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: context.appColors.white,
                  ),
                )
              : Text(
                  (isLoading ?? false) ? "" : (title ?? ''),
                  textAlign: TextAlign.center,
                  style: context.textStyles.w700f16.copyWith(
                    color: isDisabled ? color.gray : color.white,
                  ),
                  maxLines: 1,
                ),
        ),
      ),
    );
  }
}
