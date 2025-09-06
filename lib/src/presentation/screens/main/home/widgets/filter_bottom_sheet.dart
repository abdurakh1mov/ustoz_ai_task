import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/primary_button.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/home/home_cubit.dart';

import '../../../../../component/category_with_border.dart';
import '../../../../../component/simple_bottom_sheet.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedType = "All";
  String category = "All";
  String selectedDate = "All";
  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.read<HomeCubit>().state;
    selectedType = state.isIncome == null
        ? "All"
        : (state.isIncome ?? false)
        ? "Income"
        : "Expense";
    selectedDate = state.selectedDate == "" ? "All" : state.selectedDate;
    category = state.selectedCategory == "" ? "All" : state.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            left: 16.w,
            right: 16.w,
            bottom: 50.h,
            top: 24.h,
          ),
          decoration: BoxDecoration(
            color: context.appColors.linear1,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            children: [
              CategoryWithBorder(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (typesContext) {
                      return SimpleBottomSheet(
                        title: "Types",
                        list: state.typesList,
                        onTap: (type) {
                          setState(() {
                            selectedType = type;
                          });
                        },
                      );
                    },
                  );
                },
                value: selectedType,
                title: "Type",
              ),
              16.verticalSpace,
              CategoryWithBorder(
                onTap: () {
                  if (selectedType == "All") {
                    showAppSnackBar("Please select type first");
                  } else {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (categoryBottomSheet) {
                        return SimpleBottomSheet(
                          title: "Categories",
                          list: (selectedType == "Income")
                              ? state.categoriesIncome
                                    .map((e) => e.title)
                                    .toList()
                              : state.categories.map((e) => e.title).toList(),
                          onTap: (category) {
                            setState(() {
                              this.category = category;
                            });
                          },
                        );
                      },
                    );
                  }
                },
                value: category,
                title: "Category",
              ),
              16.verticalSpace,
              CategoryWithBorder(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (dateContext) {
                      return SimpleBottomSheet(
                        title: "Dates",
                        list: state.staticDatesList,
                        onTap: (newDate) {
                          setState(() {
                            selectedDate = newDate;
                          });
                        },
                      );
                    },
                  );
                },
                value: selectedDate,
                title: "Date",
              ),
              24.verticalSpace,
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      backgroundColor: context.appColors.silverGray,
                      onPressed: () {
                        // context.read<HomeCubit>().clearFilters();
                        selectedDate = "All";
                        selectedType = "All";
                        category = "All";
                        setState(() {});
                      },
                      title: "Clear",
                    ),
                  ),
                  16.w.horizontalSpace,
                  Expanded(
                    child: PrimaryButton(
                      onPressed: () {
                        context.read<HomeCubit>().getFilteredTransactions(
                          income: selectedType == "All"
                              ? null
                              : (selectedType == "Income" ? true : false),
                          category: category,
                          selectedDate: selectedDate,
                        );
                        Navigator.pop(context);
                      },
                      title: "Filter",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
