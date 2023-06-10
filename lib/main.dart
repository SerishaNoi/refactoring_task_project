import 'package:eds_test/data/services/local_storage_halper/hive_init.dart';
import 'package:eds_test/injections/dependency_injections.dart';
import 'package:eds_test/presentation/main_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();
  getItInit();
  await registerHiveAdapters();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test Task Application',
      home: MainPage(),
    );
  }
}
