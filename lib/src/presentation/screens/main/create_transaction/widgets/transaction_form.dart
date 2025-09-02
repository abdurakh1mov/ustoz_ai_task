import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/core/utils/formatters.dart';
import 'package:ustoz_ai_task/src/data/model/category_model.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/category_bottom_sheet.dart';

import '../../../../../component/category_with_border.dart';
import '../../../../../component/transaction_text_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key, required this.categories});
  final List<CategoryModel>? categories;
  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  bool isUsd = false;
  DateTime selectedDate = DateTime.now();
  late CurrencyDetectorFormatter _formatter;
  String category = "Select category";
  final TextEditingController noteController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void didChangeDependencies() {
    _formatter = CurrencyDetectorFormatter(isUsd: isUsd);
    super.didChangeDependencies();
  }

  void _toggleCurrency(bool value) {
    setState(() {
      isUsd = value;
      _formatter = CurrencyDetectorFormatter(isUsd: isUsd);
      final oldText = amountController.text;
      amountController.value = _formatter.formatEditUpdate(
        const TextEditingValue(text: ""),
        TextEditingValue(text: oldText),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Amount", style: textStyles.w600f14),
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: Switch(
                    activeThumbColor: context.appColors.softBlue,
                    activeTrackColor: context.appColors.white,
                    inactiveThumbColor: context.appColors.silverGray,
                    inactiveTrackColor: context.appColors.white,
                    trackOutlineColor: WidgetStateProperty.all(
                      context.appColors.white,
                    ),
                    value: isUsd,
                    onChanged: (newValue) {
                      _toggleCurrency(newValue);
                    },
                  ),
                ),
                20.w.horizontalSpace,
                Text("USD", style: textStyles.w500f12),
              ],
            ),
          ],
        ),
        8.h.verticalSpace,
        TransactionTextField(
          onChanged: (value) {},
          formatter: [_formatter],
          controller: amountController,
        ),
        12.h.verticalSpace,
        Text("Category", style: textStyles.w600f14),
        8.h.verticalSpace,
        CategoryWithBorder(
          title: category,
          onTap: () {
            showModalBottomSheet(
              context: context,
              constraints: BoxConstraints(maxHeight: 0.6.sh),
              builder: (contextBottomSheet) {
                return CategoryBottomSheet(
                  categories: widget.categories ?? [],
                  onTap: (category) {
                    setState(() {
                      this.category = category;
                    });
                  },
                );
              },
            );
          },
        ),
        12.h.verticalSpace,
        Text("Note", style: textStyles.w600f14),
        8.h.verticalSpace,
        TransactionTextField(
          controller: noteController,
          onChanged: (value) {},
          inputType: TextInputType.text,
        ),
        12.h.verticalSpace,
        Text("Date", style: textStyles.w600f14),
        8.h.verticalSpace,
        CategoryWithBorder(
          title: DateFormat("d MMMM yyyy").format(selectedDate),
          onTap: () => _pickDate(context),
        ),
      ],
    ).padding(EdgeInsets.symmetric(horizontal: 16.w));
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectedDate = pickedDate;
      setState(() {});
    } else {
      printLog("Date picking canceled");
    }
  }
}
