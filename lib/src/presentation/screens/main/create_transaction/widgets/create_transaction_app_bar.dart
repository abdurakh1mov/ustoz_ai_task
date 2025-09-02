import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class CreateTransactionAppBar extends StatelessWidget {
  const CreateTransactionAppBar({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              BackButton(color: context.appColors.white),
              Text("Trans.", style: context.textStyles.w600f14),
              const Spacer(),
              Text(
                index == 0
                    ? "Income"
                    : (index == 1)
                    ? "Expense"
                    : "Transfer",
                style: context.textStyles.w600f14,
              ),
            ],
          ),
        ),
        const Expanded(child: SizedBox.shrink()),
      ],
    );
  }
}
