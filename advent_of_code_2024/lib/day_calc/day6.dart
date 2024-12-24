import 'package:adventofcode2024/inputs/day6input.dart';

class Day6Calc {
  ((int, int, int, int), Map<int, Map<int, String>>) readInput() {
    String input = Day6input().input;

    Map<int, Map<int, String>> output = input
        .split("\n")
        .asMap()
        .map((rowIndex, row) => MapEntry(rowIndex, row.split("").asMap()));

    int guardX = 0;
    int guardY = 0;
    for (String line in input.split("\n")) {
      if (line.contains("^")) {
        guardY = line.indexOf("^");
        break;
      }
      guardX++;
    }

    (int, int, int, int) guardPos = (guardX, guardY, -1, 0);
    return (guardPos, output);
  }

  String partOne() {
    int output = 0;
    var ((guardX, guardY, guardDX, guardDY), map) = readInput();

    while (map[guardX]?[guardY] != null) {
      if (map[guardX]?[guardY] != "#") {
        Map<int, String> guardRow = Map.from(map[guardX]!);
        guardRow[guardY] = "*";
        map[guardX] = guardRow;
        guardX += guardDX;
        guardY += guardDY;
      } else {
        // step back and turn
        guardX -= guardDX;
        guardY -= guardDY;

        int newDX = 1 * guardDY;
        int newDY = -1 * guardDX;

        guardDX = newDX;
        guardDY = newDY;
      }
      // print("");
      // for (var row in map.entries) {
      //   print(row.value.values.join());
      // }
    }

    for (var row in map.entries) {
      output += row.value.values.where((String place) => place == "*").length;
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    var ((guardX, guardY, guardDX, guardDY), map) = readInput();
    String dirMarker = "^";
    var (guardStartX, guardStartY) = (guardX, guardY);

    while (map[guardX]?[guardY] != null) {
      if (map[guardX]?[guardY] != "#") {
        if (map.containsKey(guardX + guardDX) &&
            map[guardX + guardDX]!.containsKey(guardY + guardDY) &&
            map[guardX + guardDX]![guardY + guardDY]! == ".") {
          // Try right?
          int testDX = 1 * guardDY;
          int testDY = -1 * guardDX;
          String testDirMarker = dirMarker == "^"
              ? ">"
              : dirMarker == ">"
                  ? "v"
                  : dirMarker == "v"
                      ? "<"
                      : "^";
          Map<int, Map<int, String>> testMap = Map.from(map);
          Map<int, String> obstacleRow = Map.from(testMap[guardX + guardDX]!);
          obstacleRow[guardY + guardDY] = "#";
          testMap[guardX + guardDX] = obstacleRow;
          if (testRight(
              guardX, guardY, testDX, testDY, testMap, testDirMarker)) {
            if (!(guardStartX == guardX + guardDX &&
                guardStartY == guardY + guardDY)) {
              Map<int, String> guardRow = Map.from(map[guardX + guardDX]!);
              guardRow[guardY + guardDY] = "${guardRow[guardY + guardDY]!}B";
              map[guardX + guardDX] = guardRow;
            }
          }
        }

        Map<int, String> guardRow = Map.from(map[guardX]!);
        guardRow[guardY] = guardRow[guardY]! + dirMarker;
        map[guardX] = guardRow;
        guardX += guardDX;
        guardY += guardDY;
      } else {
        // step back and turn
        guardX -= guardDX;
        guardY -= guardDY;

        int newDX = 1 * guardDY;
        int newDY = -1 * guardDX;
        dirMarker = dirMarker == "^"
            ? ">"
            : dirMarker == ">"
                ? "v"
                : dirMarker == "v"
                    ? "<"
                    : "^";

        guardDX = newDX;
        guardDY = newDY;
      }
    }
    // for (var row in map.entries) {
    //   print(row.value.values.join("\t"));
    // }

    for (var row in map.entries) {
      output +=
          row.value.values.where((String place) => place.contains("B")).length;
    }

    return output.toString();
  }

  bool testRight(int guardX, int guardY, int guardDX, int guardDY,
      Map<int, Map<int, String>> map, String dirMarker) {
    bool valid = false;

    while (map[guardX]?[guardY] != null) {
      if (map[guardX]![guardY]!.contains(dirMarker)) {
        valid = true;
        break;
      }
      if (map[guardX]?[guardY] != "#") {
        Map<int, String> guardRow = Map.from(map[guardX]!);
        guardRow[guardY] = guardRow[guardY]! + dirMarker;
        map[guardX] = guardRow;
        guardX += guardDX;
        guardY += guardDY;
      } else {
        // step back and turn
        guardX -= guardDX;
        guardY -= guardDY;

        int newDX = 1 * guardDY;
        int newDY = -1 * guardDX;
        dirMarker = dirMarker == "^"
            ? ">"
            : dirMarker == ">"
                ? "v"
                : dirMarker == "v"
                    ? "<"
                    : "^";

        guardDX = newDX;
        guardDY = newDY;
      }
    }

    return valid;
  }
}
