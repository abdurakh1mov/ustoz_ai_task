import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/presentation/screens/main/home/widgets/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [HomeAppBar()]));
  }
}
