import 'package:constructor_data/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:constructor_data/widget/expenses.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        // to apply darkmode just add darkTheme option in scaffold
        // themeMode: ThemeMode.system, to access theme set by user
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ).copyWith(
            colorScheme:
                const ColorScheme.highContrastDark(background: Colors.black)),
        theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.blue,
            cardTheme: const CardTheme(shadowColor: Colors.grey),
            textTheme: const TextTheme(
                titleLarge: TextStyle(fontWeight: FontWeight.w300))),
        home: const MyHomePage(title: 'Expense 3rd  '),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Expenses(),
    );
  }
}
