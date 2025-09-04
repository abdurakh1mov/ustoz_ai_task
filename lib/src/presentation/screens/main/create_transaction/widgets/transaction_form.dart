import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ustoz_ai_task/src/component/custom_switcher.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/core/theme/app_typography.dart';
import 'package:ustoz_ai_task/src/core/utils/formatters.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/create_transaction/create_transaction_bloc.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/category_bottom_sheet.dart';

import '../../../../../component/category_with_border.dart';
import '../../../../../component/transaction_text_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({
    super.key,
    required this.onTabChanged,
    this.transaction,
    required this.isEditable,
  });
  final void Function(int index) onTabChanged;
  final TransactionModel? transaction;
  final bool isEditable;
  @override
  State<TransactionForm> createState() => TransactionFormState();
}

class TransactionFormState extends State<TransactionForm>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (widget.isEditable) {
      _tabController.index = widget.transaction?.income == true ? 0 : 1;
      isUsd = widget.transaction?.isUsd ?? false;
      noteController.text = widget.transaction?.note ?? "";
      amountController.text =
          "${widget.transaction?.amount} ${isUsd ? "USD" : "UZS"}";
      selectedDate =
          DateTime.tryParse(widget.transaction?.createdAt ?? "") ??
          DateTime.now();
      selectedCategory = widget.transaction?.category ?? "Select category";
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    formatter = CurrencyDetectorFormatter(isUsd: isUsd);
    _tabController.addListener(() {
      setState(() {
        widget.onTabChanged(_tabController.index);
        selectedCategory = "Select category";
      });
    });
  }

  bool isUsd = false;
  DateTime selectedDate = DateTime.now();
  late CurrencyDetectorFormatter formatter;
  String selectedCategory = "Select category";
  final TextEditingController noteController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  Map<String, dynamic> getFormData() {
    return {
      "isUsd": isUsd,
      "note": noteController.text,
      "amount": amountController.text,
      "date": selectedDate,
      "category": selectedCategory,
    };
  }

  void _toggleCurrency(bool value) {
    setState(() {
      isUsd = value;
      formatter = CurrencyDetectorFormatter(isUsd: isUsd);
      final oldText = amountController.text;
      amountController.value = formatter.formatEditUpdate(
        const TextEditingValue(text: ""),
        TextEditingValue(text: oldText),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final appColors = context.appColors;
    return BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: appColors.white.withValues(alpha: 0.2),
                ),
              ),
              child: TabBar(
                tabAlignment: TabAlignment.fill,
                controller: _tabController,
                dividerColor: Colors.transparent,
                tabs: [
                  Text("Income", style: textStyles.w600f12),
                  Text('Expense', style: textStyles.w600f12),
                ],
                indicator: ContainerTabIndicator(
                  width: (1.sw / 2),
                  height: 32.h,
                  padding: EdgeInsets.only(left: 12.w, right: 12.w),
                  borderWidth: 1,
                  borderColor: appColors.white,
                  radius: BorderRadius.circular(4.r),
                ),
              ),
            ),
            20.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Amount", style: textStyles.w600f14),
                CustomSwitcher(
                  initialValue: isUsd,
                  onToggle: (value) {
                    isUsd = value;
                    _toggleCurrency(value);
                  },
                ),
              ],
            ),
            8.h.verticalSpace,
            TransactionTextField(
              onChanged: (value) {},
              formatter: [formatter],
              controller: amountController,
            ),
            12.h.verticalSpace,
            Text("Category", style: textStyles.w600f14),
            8.h.verticalSpace,
            CategoryWithBorder(
              title: selectedCategory,
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  constraints: BoxConstraints(maxHeight: 0.6.sh),
                  builder: (contextBottomSheet) {
                    return CategoryBottomSheet(
                      categories: _tabController.index == 0
                          ? state.categoriesIncome
                          : state.categories,
                      onTap: (category) {
                        setState(() {
                          selectedCategory = category;
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
      },
    );
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
