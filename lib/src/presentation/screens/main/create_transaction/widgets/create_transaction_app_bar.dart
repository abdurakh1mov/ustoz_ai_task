import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class CreateTransactionAppBar extends StatelessWidget {
  const CreateTransactionAppBar({super.key, required this.iEditable});
  final bool iEditable;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            BackButton(color: context.appColors.white),
            Text("Trans.", style: context.textStyles.w600f14),
          ],
        ),
        const Spacer(),
        Text(
          iEditable ? "Edit Transaction" : "Create Transaction",
          style: context.textStyles.w700f16,
        ),
      ],
    ).padding(EdgeInsets.only(right: 16.w));
  }
}
