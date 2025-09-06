import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/statistics/widgets/line_chart.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/statistics/widgets/pie_chart.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SizedBox(height: 200, width: 200, child: CustomPieChart()),
        ),
        CustomLineChart(),
      ],
    );
  }
}
