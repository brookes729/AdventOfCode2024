import 'package:adventofcode2024/inputs/day10input.dart';

class Day10Calc {
  int output = 0;
  List<List<int>> readInput() {
    List<List<int>> output = Day10input()
        .input
        .split("\n")
        .map((x) => x.split("").map((y) => (int.parse(y))).toList())
        .toList();

    return output;
  }

  String partOne() {
    var input = readInput();

    List<(int, int)> starts = [];
    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input[i].length; j++) {
        if (input[i][j] == 0) {
          starts.add((i, j));
        }
      }
    }

    for (var (startX, startY) in starts) {
      output += navigateToNine(input, startX, startY).$1.length;
    }

    return output.toString();
  }

  String partTwo() {
    var input = readInput();

    List<(int, int)> starts = [];
    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input[i].length; j++) {
        if (input[i][j] == 0) {
          starts.add((i, j));
        }
      }
    }

    for (var (startX, startY) in starts) {
      output += navigateToNine(input, startX, startY).$2;
    }

    return output.toString();
  }

  (Set<(int, int)>, int) navigateToNine(
      List<List<int>> input, int startX, int startY) {
    Set<(int, int)> ninesLocation = {};
    var trailsCount = 0;

    int currentLocation = input[startX][startY];

    if (currentLocation == 9) {
      return ({(startX, startY)}, 1);
    }

    if (input.length > startX + 1 &&
        startX + 1 > -1 &&
        input[startX].length > startY &&
        startY > -1 &&
        input[startX + 1][startY] - 1 == currentLocation) {
      var nines = navigateToNine(input, startX + 1, startY);
      ninesLocation = ninesLocation.union(nines.$1);
      trailsCount += nines.$2;
    }
    if (input.length > startX - 1 &&
        startX - 1 > -1 &&
        input[startX].length > startY &&
        startY > -1 &&
        input[startX - 1][startY] - 1 == currentLocation) {
      var nines = navigateToNine(input, startX - 1, startY);
      ninesLocation = ninesLocation.union(nines.$1);
      trailsCount += nines.$2;
    }
    if (input.length > startX &&
        startX > -1 &&
        input[startX].length > startY + 1 &&
        startY + 1 > -1 &&
        input[startX][startY + 1] - 1 == currentLocation) {
      var nines = navigateToNine(input, startX, startY + 1);
      ninesLocation = ninesLocation.union(nines.$1);
      trailsCount += nines.$2;
    }
    if (input.length > startX &&
        startX > -1 &&
        input[startX].length > startY - 1 &&
        startY - 1 > -1 &&
        input[startX][startY - 1] - 1 == currentLocation) {
      var nines = navigateToNine(input, startX, startY - 1);
      ninesLocation = ninesLocation.union(nines.$1);
      trailsCount += nines.$2;
    }

    return (ninesLocation, trailsCount);
  }
}
