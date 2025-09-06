import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class CategoryWithBorder extends StatelessWidget {
  const CategoryWithBorder({
    super.key,
    required this.title,
    required this.onTap,
    required this.value,
  });
  final String title;
  final String value;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final appColors = context.appColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textStyles.w600f14),
        8.h.verticalSpace,
        Container(
          height: 48.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: appColors.white.withValues(alpha: 0.2),
              width: 1.w,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(8.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(value, style: textStyles.w500f12),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: appColors.white,
                  ),
                ],
              ).padding(EdgeInsets.symmetric(horizontal: 16.w)),
            ),
          ),
        ),
      ],
    );
  }
}
