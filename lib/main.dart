import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sample_2/db/models/data_modal.dart';
import 'package:sample_2/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());

  // if (Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
  //   Hive.registerAdapter(StudentModelAdapter());
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
