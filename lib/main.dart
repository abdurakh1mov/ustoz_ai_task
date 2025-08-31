import 'package:flutter/material.dart';
import 'package:ustoz_ai_task/firebase_options.dart';
import 'package:ustoz_ai_task/src/app.dart';
import 'package:ustoz_ai_task/src/core/cache/db_base.dart';
import 'package:ustoz_ai_task/src/core/injector/injector.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await HiveBase.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
