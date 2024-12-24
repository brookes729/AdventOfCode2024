import 'package:adventofcode2024/common.dart';
import 'package:adventofcode2024/day_calc/day_calc.dart';
import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DayPageState();

  final int day;

  const DayPage(this.day, key) : super(key: key);
}

class DayPageState extends State<DayPage> {
  String partOneValue = '...';
  String partTwoValue = '...';
  String timeTaken = '0';

  doTheThing() {
    setState(() {
      partOneValue = '...';
      partTwoValue = '...';
      timeTaken = '0';
    });

    setState(() {
      Stopwatch stopwatch = Stopwatch()..start();
      partOneValue = DayCalc().calculate(widget.day, 1);
      partTwoValue = DayCalc().calculate(widget.day, 2);
      timeTaken = '${stopwatch.elapsed.inMilliseconds.toString()}ms';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Day ${widget.day}'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to Day ${widget.day}!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GoButton(onPressed: doTheThing),
          Result(
            text: 'Part 1',
            value: partOneValue,
          ),
          Result(
            text: 'Part 2',
            value: partTwoValue,
          ),
          Result(
            text: 'Time Taken',
            value: timeTaken,
          ),
        ],
      ),
    );
  }
}
