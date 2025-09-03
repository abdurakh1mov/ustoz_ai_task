import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/primary_button.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/create_transaction/create_transaction_bloc.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/create_transaction_app_bar.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/transaction_form.dart';

import '../../../../data/model/category_model.dart';

class CreateTransactionScreen extends StatefulWidget {
  const CreateTransactionScreen({super.key});
  @override
  State<CreateTransactionScreen> createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState extends State<CreateTransactionScreen> {
  int index = 0;
  final _formKey = GlobalKey<TransactionFormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
      builder: (context, state) {
        return Screen(
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: context.appColors.white,
                  ),
                )
              : Column(
                  children: [
                    CreateTransactionAppBar(index: index),
                    12.h.verticalSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            16.h.verticalSpace,
                            BlocProvider.value(
                              value: context.read<CreateTransactionBloc>(),
                              child: TransactionForm(
                                key: _formKey,
                                onTabChanged: (index) {
                                  setState(() {
                                    this.index = index;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    PrimaryButton(
                      isLoading: state.isCreatingLoading,
                      onPressed: () {
                        final formData = _formKey.currentState!.getFormData();
                        final isUsd = formData["isUsd"] as bool;
                        final note = formData["note"] as String;
                        final amount = formData["amount"] as String;
                        final date = formData["date"] as DateTime;
                        final category = formData["category"] as String;
                        if (amount
                            .replaceAll(" ", "")
                            .replaceAll(isUsd ? "USD" : "UZS", "")
                            .isEmpty) {
                          showAppSnackBar("Please enter amount");
                        } else if (category == "Select category") {
                          showAppSnackBar("Please select category");
                        } else if (note.isEmpty) {
                          showAppSnackBar("Please enter note");
                        } else {
                          // printLog("fmsakmfka $index");
                          context.read<CreateTransactionBloc>().add(
                            CreateTransactionEvent.createTransaction(
                              context: context,
                              isUsd: isUsd,
                              isIncome: index == 0,
                              note: note,
                              amount: amount,
                              date: date,
                              category: CategoryModel(title: category),
                            ),
                          );
                        }
                      },
                      title: "Save",
                    ).padding(
                      EdgeInsets.only(
                        bottom: 40.h,
                        left: 16.w,
                        right: 16.w,
                        top: 8.h,
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
