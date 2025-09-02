import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/primary_button.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/container_tab_bar.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/create_transaction_app_bar.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/transaction_form.dart';

import '../../../../data/model/category_model.dart';

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({super.key, required this.categories});
  final List<CategoryModel>? categories;
  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Screen(
      body: Column(
        children: [
          CreateTransactionAppBar(index: index),
          12.h.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ContainerTabBar(
                    onTap: (index) {
                      setState(() {
                        this.index = index;
                      });
                    },
                  ),
                  16.h.verticalSpace,
                  TransactionForm(categories: widget.categories),
                ],
              ),
            ),
          ),
          PrimaryButton(onPressed: () {}, title: "Save").padding(
            EdgeInsets.only(bottom: 40.h, left: 16.w, right: 16.w, top: 8.h),
          ),
        ],
      ),
    );
  }
}
