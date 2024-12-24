import 'package:adventofcode2024/common.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Advent of Code 2024',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Advent of Code 2024 Home'),
    );
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: const Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 0),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 1),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 2),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 3),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 4),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 5),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 6),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 7),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 8),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 9),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 10),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 11),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 12),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 13),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 14),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 15),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 16),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 17),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 18),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 19),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 20),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 21),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 22),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 23),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChristmasTreeWidget(dayNumber: 24),
                  SizedBox(width: 10),
                  ChristmasTreeWidget(dayNumber: 25),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
