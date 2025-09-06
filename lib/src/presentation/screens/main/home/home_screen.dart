import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/component/screen.dart';
import 'package:ustoz_ai_task/src/core/constants/global_keys.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';
import 'package:ustoz_ai_task/src/presentation/blocs/home/home_cubit.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/widgets/filter_bottom_sheet.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/widgets/home_app_bar.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/widgets/transaction_item.dart';

import '../../../../data/model/transaction_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool rated = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: context.appColors.white,
                ),
              )
            : Screen(
                key: GlobalKeys.homeScaffoldKey,
                body: Column(
                  children: [
                    HomeAppBar(
                      filterOnTap: () {
                        Scaffold.of(context).showBottomSheet(
                          backgroundColor: Colors.transparent,
                          constraints: BoxConstraints(maxHeight: 0.6.sh),
                          (contextFilter) => BlocProvider.value(
                            value: context.read<HomeCubit>(),
                            child: FilterBottomSheet(),
                          ),
                        );
                      },
                      incomes: state.userData?.income ?? 0,
                      expenses: state.userData?.expense ?? 0,
                      onToggle: (value) {
                        setState(() {
                          rated = value;
                        });
                      },
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 100.h),
                        itemCount: state.userTransactions.length,
                        itemBuilder: (context, index) {
                          return TransactionItem(
                            rated: rated,
                            rate: state.rate?.rate ?? "1",
                            transaction:
                                state.userTransactions[index] ??
                                TransactionModel(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
