import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ustoz_ai_task/src/component/primary_button.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/component/warning_dialog.dart';
import 'package:ustoz_ai_task/src/core/extension/widget_extension.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/data/model/transaction_model.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/create_transaction/create_transaction_bloc.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/create_transaction_app_bar.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/create_transaction/widgets/transaction_form.dart';

class CreateTransactionScreen extends StatefulWidget {
  const CreateTransactionScreen({
    super.key,
    required this.isEditable,
    this.transaction,
  });
  final bool isEditable;
  final TransactionModel? transaction;
  @override
  State<CreateTransactionScreen> createState() =>
      _CreateTransactionScreenState();
}

class _CreateTransactionScreenState extends State<CreateTransactionScreen> {
  int index = 0;
  final _formKey = GlobalKey<TransactionFormState>();
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateTransactionBloc, CreateTransactionState>(
      builder: (context, state) {
        printLog("faskmfmaksmfk ${widget.transaction?.id}");
        return Screen(
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: context.appColors.white,
                  ),
                )
              : Column(
                  children: [
                    CreateTransactionAppBar(iEditable: widget.isEditable),
                    12.h.verticalSpace,
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            16.h.verticalSpace,
                            BlocProvider.value(
                              value: context.read<CreateTransactionBloc>(),
                              child: TransactionForm(
                                isEditable: widget.isEditable,
                                transaction: widget.transaction,
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
                    if (widget.isEditable)
                      PrimaryButton(
                        isLoading: state.isDeletingLoading,
                        backgroundColor: context.appColors.red,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return WarningDialog(
                                onYes: () {
                                  context.read<CreateTransactionBloc>().add(
                                    CreateTransactionEvent.deleteTransaction(
                                      transaction: widget.transaction!,
                                      context: context,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                        title: "Delete",
                      ).padding(
                        EdgeInsets.only(
                          bottom: 40.h,
                          left: 16.w,
                          right: 16.w,
                          top: 8.h,
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
                          final bloc = context.read<CreateTransactionBloc>();
                          if (widget.isEditable) {
                            final TransactionModel transaction =
                                TransactionModel(
                                  (b) => b
                                    ..id = widget.transaction?.id
                                    ..amount = amount.replaceAll(
                                      isUsd ? "USD" : "UZS",
                                      "",
                                    )
                                    ..category = category
                                    ..note = note
                                    ..createdAt = DateFormat(
                                      'yyyy-MM-dd HH:mm',
                                    ).format(date)
                                    ..isUsd = isUsd
                                    ..income = index == 0,
                                );

                            bloc.add(
                              CreateTransactionEvent.changeTransaction(
                                transaction: transaction,
                                context: context,
                              ),
                            );
                          } else {
                            final TransactionModel transaction =
                                TransactionModel(
                                  (b) => b
                                    ..id = ""
                                    ..amount = amount.replaceAll(
                                      isUsd ? "USD" : "UZS",
                                      "",
                                    )
                                    ..category = category
                                    ..note = note
                                    ..createdAt = DateFormat(
                                      'yyyy-MM-dd HH:mm',
                                    ).format(date)
                                    ..isUsd = isUsd
                                    ..income = index == 0,
                                );
                            bloc.add(
                              CreateTransactionEvent.createTransaction(
                                context: context,
                                transaction: transaction,
                              ),
                            );
                          }
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
