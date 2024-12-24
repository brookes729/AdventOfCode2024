import 'package:adventofcode2024/inputs/day7input.dart';

class Day7Calc {
  List<String> readInput() {
    String input = Day7input().input;

    List<String> output = input.split("\n");

    return output;
  }

  String partOne() {
    int output = 0;
    var input = readInput();

    for (String equation in input) {
      List<int> equationParts = equation
          .replaceAll(RegExp(r':'), '')
          .split(" ")
          .map((String x) => int.parse(x))
          .toList();
      int target = equationParts.removeAt(0);

      List<int> outcomes = [equationParts.removeAt(0)];

      for (int value in equationParts) {
        List<int> newOutcomes = [];
        for (int outcome in outcomes) {
          newOutcomes.add(outcome + value);
          newOutcomes.add(outcome * value);
        }
        outcomes = newOutcomes;
      }

      if (outcomes.contains(target)) {
        output += target;
      }
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    var input = readInput();

    for (String equation in input) {
      List<int> equationParts = equation
          .replaceAll(RegExp(r':'), '')
          .split(" ")
          .map((String x) => int.parse(x))
          .toList();
      int target = equationParts.removeAt(0);

      List<int> outcomes = [equationParts.removeAt(0)];

      for (int value in equationParts) {
        List<int> newOutcomes = [];
        for (int outcome in outcomes) {
          newOutcomes.add(outcome + value);
          newOutcomes.add(outcome * value);
          newOutcomes.add(int.parse("$outcome$value"));
        }
        outcomes = newOutcomes;
      }

      if (outcomes.contains(target)) {
        output += target;
      }
    }

    return output.toString();
  }
}
