import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/widgets/home_app_bar.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/widgets/transaction_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppBar(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(bottom: 100.h),
            itemCount: 10,
            itemBuilder: (context, index) {
              return TransactionItem(transactionType: "Expense");
            },
          ),
        ),
      ],
    );
  }
}
