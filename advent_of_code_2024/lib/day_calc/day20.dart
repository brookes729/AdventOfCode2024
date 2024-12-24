import 'package:adventofcode2024/inputs/day20input.dart';

class Day20Calc {
  List<List<String>> readInput() {
    List<List<String>> output = Day20input()
        .input
        .split("\n")
        .map((line) => line.split("").toList())
        .toList();

    return output;
  }

  String partOne() {
    var input = readInput();

    var (startX, startY, endX, endY) = (0, 0, 0, 0);

    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input[i].length; j++) {
        if (input[i][j] == "S") {
          startX = i;
          startY = j;
          input[i][j] = ".";
        } else if (input[i][j] == "E") {
          endX = i;
          endY = j;
          input[i][j] = ".";
        }
      }
    }

    Map<(int, int), int> visited = {};

    floodFill(input, startX, startY, visited, 0);

    Map<int, int> cheatTimes = {};

    for (var visit in visited.entries) {
      var (visitX, visitY) = visit.key;

      for (var (dx, dy) in [(2, 0), (-2, 0), (0, 2), (0, -2)]) {
        if (visited.containsKey((visitX + dx, visitY + dy))) {
          var cheat = visited[(visitX + dx, visitY + dy)]! - visit.value - 2;
          if (cheat > 0) {
            cheatTimes.update(cheat, (x) => ++x, ifAbsent: () => 1);
          }
        }
      }
    }

    var output = 0;
    for (var cheatTime in cheatTimes.entries) {
      if (cheatTime.key > 99) {
        output += cheatTime.value;
      }
    }

    return '$output';
  }

  String partTwo() {
    var input = readInput();

    var (startX, startY, endX, endY) = (0, 0, 0, 0);

    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input[i].length; j++) {
        if (input[i][j] == "S") {
          startX = i;
          startY = j;
          input[i][j] = ".";
        } else if (input[i][j] == "E") {
          endX = i;
          endY = j;
          input[i][j] = ".";
        }
      }
    }

    Map<(int, int), int> visited = {};

    floodFill(input, startX, startY, visited, 0);

    Map<int, int> cheatTimes = {};

    for (var visit in visited.entries) {
      var (visitX, visitY) = visit.key;

      for (var checkVisit in visited.entries) {
        var (checkVisitX, checkVisitY) = checkVisit.key;
        if ((checkVisitX - visitX).abs() + (checkVisitY - visitY).abs() <= 20) {
          var cheat = visited[(checkVisitX, checkVisitY)]! -
              visit.value -
              (checkVisitX - visitX).abs() -
              (checkVisitY - visitY).abs();
          if (cheat > 0) {
            cheatTimes.update(cheat, (x) => ++x, ifAbsent: () => 1);
          }
        }
      }
    }

    var output = 0;
    for (var cheatTime in cheatTimes.entries) {
      if (cheatTime.key > 99) {
        output += cheatTime.value;
      }
    }

    return '$output';
  }

  void floodFill(List<List<String>> input, int i, int j,
      Map<(int, int), int> visited, int moves) {
    visited[(i, j)] = moves;

    if (input.length > i + 1 &&
        input[i + 1][j] == "." &&
        !visited.containsKey((i + 1, j))) {
      floodFill(input, i + 1, j, visited, moves + 1);
    }
    if (i - 1 > -1 &&
        input[i - 1][j] == "." &&
        !visited.containsKey((i - 1, j))) {
      floodFill(input, i - 1, j, visited, moves + 1);
    }
    if (input[i].length > j + 1 &&
        input[i][j + 1] == "." &&
        !visited.containsKey((i, j + 1))) {
      floodFill(input, i, j + 1, visited, moves + 1);
    }
    if (j - 1 > -1 &&
        input[i][j - 1] == "." &&
        !visited.containsKey((i, j - 1))) {
      floodFill(input, i, j - 1, visited, moves + 1);
    }
  }
}
