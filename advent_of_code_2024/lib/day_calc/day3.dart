import 'package:adventofcode2024/inputs/day3input.dart';

class Day3Calc {
  String readInput() {
    return Day3input().input;
  }

  String partOne() {
    int output = 0;
    String input = readInput();

    RegExp pattern = RegExp("mul\\(\\d{0,3},\\d{0,3}\\)");

    var matches = pattern.allMatches(input);

    for (var match in matches) {
      String mul = match.group(0).toString();

      output += int.parse(mul.split(",")[0].substring(4)) *
          int.parse(
              mul.split(",")[1].substring(0, mul.split(",")[1].length - 1));
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    String input = readInput();

    RegExp pattern =
        RegExp("(mul\\(\\d{0,3},\\d{0,3}\\))|(do\\(\\))|(don\\'t\\(\\))");

    var matches = pattern.allMatches(input);
    bool isDo = true;

    for (var match in matches) {
      String instruction = match.group(0).toString();

      if (instruction == "do()") {
        isDo = true;
      } else if (instruction == "don't()") {
        isDo = false;
      } else if (isDo) {
        output += int.parse(instruction.split(",")[0].substring(4)) *
            int.parse(instruction
                .split(",")[1]
                .substring(0, instruction.split(",")[1].length - 1));
      }
    }

    return output.toString();
  }
}
