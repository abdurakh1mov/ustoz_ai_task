import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({super.key, required this.transactionType});
  final String transactionType;
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textStyles = context.textStyles;
    return Column(
      children: [
        ListTile(
          onTap: () {
            printLog("fskmafkmaskmfa tapped");
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: appColors.softBlue,
            child: Icon(
              Icons.attach_money_rounded,
              color: appColors.white,
            ),
          ),
          title: Text("Shopping", style: textStyles.w500f14),
          subtitle: Text("May 20, 2023", style: textStyles.w400f12),
          trailing: Text(
            "- \$50.00",
            style: textStyles.w500f12.copyWith(
              color: transactionType == "Income"
                  ? appColors.softBlue
                  : (transactionType == "Expense"
                        ? appColors.red
                        : appColors.white),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
