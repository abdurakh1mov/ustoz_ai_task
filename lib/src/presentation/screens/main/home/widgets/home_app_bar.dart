import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/generated/assets.gen.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Home", style: context.textStyles.w700f18),
            const Spacer(),
            IconButton(icon: Assets.icons.filter.svg(), onPressed: () {}),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: 16.w)),
        Divider(color: context.appColors.silverGray, height: 1.h),
        8.h.verticalSpace,
        Row(
          children: [
            _build(
              title: "Доход",
              subtitle: "12 000 000",
              context: context,
              subtitleColor: context.appColors.silverGray,
            ),
            _build(
              title: "Расход",
              subtitle: "9 000 000",
              subtitleColor: context.appColors.red,
              context: context,
            ),
            _build(title: "Баланс", subtitle: "3 000 000", context: context),
          ],
        ),
        8.h.verticalSpace,
        Divider(color: context.appColors.silverGray, height: 1.h),
      ],
    );
  }

  Widget _build({
    required String title,
    required String subtitle,
    Color? subtitleColor,
    required BuildContext context,
  }) {
    return Expanded(
      child: Column(
        children: [
          Text(title, style: context.textStyles.w500f12),
          Text(
            subtitle,
            style: context.textStyles.w400f14.copyWith(
              color: subtitleColor ?? context.appColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
