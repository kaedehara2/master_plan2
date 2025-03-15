import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:master_plan2/providers/plan_provider.dart';
import 'package:master_plan2/views/plan_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlanProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Master Plan 2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlanScreen(), // INI PENTING! Harus menampilkan PlanScreen
      ),
    );
  }
}
