import 'package:adventofcode2024/day_page/day_page.dart';
import 'package:flutter/material.dart';

class GoButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GoButton({required this.onPressed, super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: const Text(
        'Go',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Result extends StatelessWidget {
  final String text;
  final String value;

  const Result({required this.text, required this.value, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text = $value',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )
    ]);
  }
}

class ChristmasTreeWidget extends StatelessWidget {
  final int dayNumber;

  const ChristmasTreeWidget({
    required this.dayNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DayPage(dayNumber, ValueKey(dayNumber)),
            ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.park,
            size: 60.0,
            color: dayNumber < DateTime.now().day
                ? const Color.fromARGB(143, 153, 195, 74)
                : dayNumber == DateTime.now().day
                    ? const Color.fromARGB(255, 132, 175, 76)
                    : const Color.fromARGB(113, 255, 86, 34),
          ),
          const SizedBox(height: 5),
          Text(
            'Day $dayNumber',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
