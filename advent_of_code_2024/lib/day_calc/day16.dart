import 'package:adventofcode2024/inputs/day16input.dart';

class Day16Calc {
  List<List<String>> readInput() {
    var output = Day16input()
        .input
        .split("\n")
        .map((line) => line.split("").toList())
        .toList();

    return output;
  }

  String partOne() {
    var map = readInput();

    map[map.length - 2][1] = ".";
    map[1][map[0].length - 2] = ".";

    var (output, _) = floodFill(map, map.length - 2, 1, ">");

    // printMap(scoreMap, map);

    return '$output';
  }

  (int, int) floodFill(List<List<String>> input, int startingI, int startingJ,
      String startingDirection) {
    Set<(int, int, String, int, Set<(int, int)>)> remainingStates = {
      (startingI, startingJ, startingDirection, 0, {})
    };
    Map<int, Set<(int, int)>> output = {};
    var (endI, endJ) = (1, input[1].length - 2);
    var minScore = 99999;

    Map<(int, int, String), int> bestScore = {};

    while (remainingStates.isNotEmpty) {
      var (i, j, direction, score, path) = remainingStates.first;
      remainingStates.remove((i, j, direction, score, path));
      if (score > minScore) {
        continue;
      }

      if (path.contains((i, j))) {
        continue;
      }
      path.add((i, j));

      if (i == endI && j == endJ) {
        minScore = score;
        output.containsKey(score)
            ? output[score]!.addAll(path)
            : output[score] = path;
        continue;
      }

      // printMap(scoreMap, input);

      if (bestScore.containsKey((i, j, direction)) &&
          bestScore[(i, j, direction)]! < score) {
        continue;
      }
      bestScore[(i, j, direction)] = score;

      if (input.length > i + 1 && input[i][j] == input[i + 1][j]) {
        if (direction == "v") {
          if (!bestScore.containsKey((i + 1, j, direction)) ||
              bestScore[(i + 1, j, direction)]! > score + 1) {
            remainingStates.add((i + 1, j, "v", score + 1, Set.from(path)));
          }
        } else if ((direction == ">" || direction == "<")) {
          if (!bestScore.containsKey((i + 1, j, direction)) ||
              bestScore[(i + 1, j, direction)]! > score + 1001) {
            remainingStates.add((i + 1, j, "v", score + 1001, Set.from(path)));
          }
        }
      }
      if (i - 1 > -1 && input[i][j] == input[i - 1][j]) {
        if (direction == "^") {
          if (!bestScore.containsKey((i - 1, j, direction)) ||
              bestScore[(i - 1, j, direction)]! > score + 1) {
            remainingStates.add((i - 1, j, "^", score + 1, Set.from(path)));
          }
        } else if ((direction == ">" || direction == "<")) {
          if (!bestScore.containsKey((i - 1, j, direction)) ||
              bestScore[(i - 1, j, direction)]! > score + 1001) {
            remainingStates.add((i - 1, j, "^", score + 1001, Set.from(path)));
          }
        }
      }
      if (input[i].length > j + 1 && input[i][j] == input[i][j + 1]) {
        if (direction == ">") {
          if (!bestScore.containsKey((i, j + 1, direction)) ||
              bestScore[(i, j + 1, direction)]! > score + 1) {
            remainingStates.add((i, j + 1, ">", score + 1, Set.from(path)));
          }
        } else if ((direction == "v" || direction == "^")) {
          if (!bestScore.containsKey((i, j + 1, direction)) ||
              bestScore[(i, j + 1, direction)]! > score + 1001) {
            remainingStates.add((i, j + 1, ">", score + 1001, Set.from(path)));
          }
        }
      }
      if (j - 1 > -1 && input[i][j] == input[i][j - 1]) {
        if (direction == "<") {
          if (!bestScore.containsKey((i, j - 1, direction)) ||
              bestScore[(i, j - 1, direction)]! > score + 1) {
            remainingStates.add((i, j - 1, "<", score + 1, Set.from(path)));
          }
        } else if ((direction == "v" || direction == "^")) {
          if (!bestScore.containsKey((i, j - 1, direction)) ||
              bestScore[(i, j - 1, direction)]! > score + 1001) {
            remainingStates.add((i, j - 1, "<", score + 1001, Set.from(path)));
          }
        }
      }
    }
    printMap(input, nodes: output[minScore]!);
    return (minScore, output[minScore]!.length);
  }

  void printMap(List<List<String>> map, {Set<(int, int)>? nodes}) {
    for (var i = 0; i < map.length; i++) {
      var printLine = "";
      for (var j = 0; j < map[i].length; j++) {
        if (nodes != null && nodes.contains((i, j))) {
          printLine += "O";
        } else if (map[i][j] == "#") {
          printLine += "#";
        } else {
          printLine += ".";
        }
      }
      print("$i: \t$printLine");
    }
  }

  String partTwo() {
    var map = readInput();

    map[map.length - 2][1] = ".";
    map[1][map[0].length - 2] = ".";

    var (_, output) = floodFill(map, map.length - 2, 1, ">");

    // printMap(scoreMap, map);

    return '$output';
  }
}
