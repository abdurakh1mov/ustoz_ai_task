import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/src/app.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';

void main() async{
  await configureDependencies();
  runApp(const MyApp());
}
