import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    super.key,
    required this.isIncome,
    required this.category,
    required this.date,
    required this.amount,
    required this.isUsd,
    required this.note,
    required this.rate,
    required this.rated,
  });
  final bool isIncome;
  final String category;
  final String date;
  final String amount;
  final bool isUsd;
  final String note;
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
            printLog("fskmafkmaskmfa tapped");
          },
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: appColors.white,
            child: Icon(
              widget.isIncome
                  ? Icons.arrow_circle_down_rounded
                  : Icons.arrow_circle_up_rounded,
              color: widget.isIncome ? appColors.softBlue : appColors.red,
              size: 30,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.category, style: textStyles.w500f14),
              Text(
                widget.note,
                style: textStyles.w500f12,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          subtitle: Text(
            widget.date,
            style: textStyles.w400f12.copyWith(color: appColors.gray),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${widget.isIncome ? "+" : "-"} ${widget.amount} ${widget.isUsd ? "\$" : "SO'M"}",
                style: textStyles.w500f12.copyWith(
                  color: widget.isIncome ? appColors.softBlue : appColors.red,
                ),
              ),
              Text(
                _calculateUzs(widget.amount, widget.rate),
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

    if (widget.isUsd && widget.rated) {
      usd = true;
      value = parsedAmount;
    } else if (!widget.isUsd && widget.rated) {
      usd = true;
      value = parsedAmount / parsedRate;
    } else if (widget.isUsd && !widget.rated) {
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
