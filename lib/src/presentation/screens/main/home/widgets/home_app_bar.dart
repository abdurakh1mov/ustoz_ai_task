import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/generated/assets.gen.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

import '../../../../../component/custom_switcher.dart';
import '../../../../../core/utils/formatters.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.onToggle,
    required this.incomes,
    required this.expenses,
    required this.filterOnTap,
  });
  final void Function(bool isUsd) onToggle;
  final int incomes;
  final int expenses;
  final void Function() filterOnTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Home", style: context.textStyles.w700f18),
            const Spacer(),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomSwitcher(
                    onToggle: (value) {
                      onToggle(value);
                    },
                  ),
                ).padding(EdgeInsets.only(right: 12.w)),
                IconButton(
                  icon: Assets.icons.filter.svg(),
                  onPressed: () {
                    filterOnTap();
                  },
                ),
              ],
            ),
          ],
        ).padding(EdgeInsets.symmetric(horizontal: 16.w)),
        Divider(color: context.appColors.silverGray, height: 1.h),
        8.h.verticalSpace,
        Row(
          children: [
            _build(
              title: "Income",
              subtitle: formatToKMLN(incomes),
              context: context,
              subtitleColor: context.appColors.softBlue,
            ),
            _build(
              title: "Expense",
              subtitle: formatToKMLN(expenses),
              subtitleColor: context.appColors.red,
              context: context,
            ),
            _build(
              title: "Balance",
              subtitle: formatToKMLN(incomes - expenses),
              context: context,
            ),
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
