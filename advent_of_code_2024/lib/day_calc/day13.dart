import 'package:adventofcode2024/inputs/day13input.dart';

class Day13Calc {
  List<(int, int, int, int, int, int)> readInput() {
    var (int aX, int aY, int bX, int bY, int pX, int pY) = (0, 0, 0, 0, 0, 0);
    List<(int, int, int, int, int, int)> output = [];
    var input = Day13input().input.split("\n");

    for (var i = 0; i < input.length; i += 4) {
      var lineNumbers = RegExp("(\\d*)");
      aX = int.parse(lineNumbers
          .allMatches(input[i])
          .map((z) => z.group(0))
          .where((x) => x!.isNotEmpty)
          .toList()[0]!);
      aY = int.parse(lineNumbers
          .allMatches(input[i])
          .map((z) => z.group(0))
          .where((x) => x!.isNotEmpty)
          .toList()[1]!);
      bX = int.parse(lineNumbers
          .allMatches(input[i + 1])
          .map((z) => z.group(0))
          .where((x) => x!.isNotEmpty)
          .toList()[0]!);
      bY = int.parse(lineNumbers
          .allMatches(input[i + 1])
          .map((z) => z.group(0))
          .where((x) => x!.isNotEmpty)
          .toList()[1]!);
      pX = int.parse(lineNumbers
          .allMatches(input[i + 2])
          .map((z) => z.group(0))
          .where((x) => x!.isNotEmpty)
          .toList()[0]!);
      pY = int.parse(lineNumbers
          .allMatches(input[i + 2])
          .map((z) => z.group(0))
          .where((x) => x!.isNotEmpty)
          .toList()[1]!);
      output.add((aX, aY, bX, bY, pX, pY));
    }

    return output;
  }

  String partOne() {
    List<(int, int, int, int, int, int)> input = readInput();
    int output = 0;

    for (var (int aX, int aY, int bX, int bY, int pX, int pY) in input) {
      double buttonBPresses = ((aY * pX) - (aX * pY)) / ((aY * bX) - (aX * bY));

      if (buttonBPresses > 0 && buttonBPresses % 1 == 0) {
        var buttonAPresses = (pX - buttonBPresses * bX) / aX;
        if (buttonAPresses > 0 && buttonAPresses % 1 == 0) {
          output += buttonBPresses.toInt();
          output += 3 * buttonAPresses.toInt();
        }
      }
    }

    return '$output';
  }

  String partTwo() {
    List<(int, int, int, int, int, int)> input = readInput();
    int output = 0;

    for (var (int aX, int aY, int bX, int bY, int pX, int pY) in input) {
      pX += 10000000000000;
      pY += 10000000000000;

      double buttonBPresses = ((aY * pX) - (aX * pY)) / ((aY * bX) - (aX * bY));

      if (buttonBPresses > 0 && buttonBPresses % 1 == 0) {
        var buttonAPresses = (pX - buttonBPresses * bX) / aX;
        if (buttonAPresses > 0 && buttonAPresses % 1 == 0) {
          output += buttonBPresses.toInt();
          output += 3 * buttonAPresses.toInt();
        }
      }
    }

    return '$output';
  }
}
