import 'dart:math';

import 'package:adventofcode2024/inputs/day1input.dart';

class Day1Calc {
  List<List<int>> readInput() {
    List<List<int>> output = List.empty(growable: true);
    output.add(List.empty(growable: true));
    output.add(List.empty(growable: true));
    final String stringInput = Day1input().input;
    List<String> lineList = stringInput.split('\n');

    for (String line in lineList) {
      output[0].add(int.parse(line.split(' ').first));
      output[1].add(int.parse(line.split(' ').last));
    }

    return output;
  }

  String partOne() {
    int output = 0;
    List<List<int>> inputLists = readInput();

    inputLists[0].sort();
    inputLists[1].sort();

    for (final (index, value) in inputLists[0].indexed) {
      int valueTwo = inputLists[1][index];
      output += max(value, valueTwo) - min(value, valueTwo);
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    List<List<int>> inputLists = readInput();

    inputLists[0].sort();
    inputLists[1].sort();

    for (final valueOne in inputLists[0]) {
      int count = 0;
      for (final valueTwo in inputLists[1]) {
        if (valueTwo == valueOne) {
          count++;
        }
      }
      output += valueOne * count;
    }

    return output.toString();
  }
}
