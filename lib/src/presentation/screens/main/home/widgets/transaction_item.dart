import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';

import '../../../../../core/navigator/router_names.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.rate,
    required this.rated,
  });
  final TransactionModel transaction;
  final String rate;
  final bool rated;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    final textStyles = context.textStyles;
    return Column(
      children: [
        ListTile(
          onTap: () {
            context.pushNamed(
              RouterNames.createTransaction,
              extra: {
                "isEditable": true,
                "transaction": TransactionModel(
                  (b) => b
                    ..id = widget.transaction.id
                    ..amount = widget.transaction.amount
                    ..category = widget.transaction.category
                    ..createdAt = widget.transaction.createdAt
                    ..income = widget.transaction.income
                    ..isUsd = widget.transaction.isUsd
                    ..note = widget.transaction.note,
                ),
              },
            );
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: appColors.white,
            child: Icon(
              widget.transaction.income
                  ? Icons.arrow_circle_down_rounded
                  : Icons.arrow_circle_up_rounded,
              color: widget.transaction.income
                  ? appColors.softBlue
                  : appColors.red,
              size: 30,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.transaction.category, style: textStyles.w500f14),
              Text(
                widget.transaction.note,
                style: textStyles.w500f12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          subtitle: Text(
            widget.transaction.createdAt,
            style: textStyles.w400f12.copyWith(color: appColors.gray),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${widget.transaction.income ? "+" : "-"} ${widget.transaction.amount} ${widget.transaction.isUsd ? "\$" : "SO'M"}",
                style: textStyles.w500f12.copyWith(
                  color: widget.transaction.income
                      ? appColors.softBlue
                      : appColors.red,
                ),
              ),
              Text(
                _calculateUzs(widget.transaction.amount, widget.rate),
                style: textStyles.w500f12.copyWith(
                  color: context.appColors.gray,
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }

  String _calculateUzs(String amount, String rate) {
    final parsedAmount = double.tryParse(amount.replaceAll(",", "")) ?? 0;
    final parsedRate = double.tryParse(rate) ?? 1;
    var usd = false;
    double value;

    if (widget.transaction.isUsd && widget.rated) {
      usd = true;
      value = parsedAmount;
    } else if (!widget.transaction.isUsd && widget.rated) {
      usd = true;
      value = parsedAmount / parsedRate;
    } else if (widget.transaction.isUsd && !widget.rated) {
      usd = false;
      value = parsedAmount * parsedRate;
    } else {
      usd = false;
      value = parsedAmount;
    }

    final formatter = NumberFormat("#,##0", "en_US");
    return "${formatter.format(value)} ${usd ? "\$" : "SO'M"}";
  }
}
