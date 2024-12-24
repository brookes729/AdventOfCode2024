import 'package:adventofcode2024/inputs/day4input.dart';

class Day4Calc {
  Map<int, Map<int, String>> readInput() {
    String input = Day4input().input;
    Map<int, Map<int, String>> output = input
        .split("\n")
        .asMap()
        .map((rowIndex, row) => MapEntry(rowIndex, row.split("").asMap()));

    return output;
  }

  String partOne() {
    int output = 0;
    var input = readInput();

    for (var rowIndex in input.keys) {
      for (var colIndex in input[rowIndex]!.keys) {
        if (input[rowIndex]![colIndex] == "X") {
          for (int dRow in [-1, 0, 1]) {
            for (int dCol in [-1, 0, 1]) {
              output += testDirection(
                      input, dRow, rowIndex, dCol, colIndex, ["M", "A", "S"])
                  ? 1
                  : 0;
            }
          }
        }
      }
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    var input = readInput();

    for (var rowIndex in input.keys) {
      for (var colIndex in input[rowIndex]!.keys) {
        if (input[rowIndex]![colIndex] == "A") {
          var valid = (
                  // Formatter doesn't like this, try to line comments up to read
                  // UL M -> DR S
                  (testDirection(input, -1, rowIndex, -1, colIndex, ["M"]) &&
                          testDirection(
                              input, 1, rowIndex, 1, colIndex, ["S"])) ||
                      // UL S -> DR M
                      (testDirection(
                              input, -1, rowIndex, -1, colIndex, ["S"]) &&
                          testDirection(
                              input, 1, rowIndex, 1, colIndex, ["M"]))) &&
              (
                  // UR M -> DL S
                  (testDirection(input, -1, rowIndex, 1, colIndex, ["M"]) &&
                          testDirection(
                              input, 1, rowIndex, -1, colIndex, ["S"])) ||
                      // UR S -> DL M
                      (testDirection(input, -1, rowIndex, 1, colIndex, ["S"]) &&
                          testDirection(
                              input, 1, rowIndex, -1, colIndex, ["M"])));

          output += valid ? 1 : 0;
        }
      }
    }
    return output.toString();
  }

  bool testDirection(Map<int, Map<int, String>> map, int dX, int startX, int dY,
      int startY, List<String> remainingChars) {
    if (remainingChars.isEmpty) {
      return true;
    } else if (map.containsKey(startX + dX) &&
        map[startX + dX]!.containsKey(startY + dY) &&
        map[startX + dX]![startY + dY] == remainingChars[0]) {
      return testDirection(map, dX, startX + dX, dY, startY + dY,
          remainingChars.skip(1).toList());
    } else {
      return false;
    }
  }
}
