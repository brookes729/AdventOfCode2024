import 'package:adventofcode2024/inputs/day14input.dart';

class Day14Calc {
  List<List<int>> readInput() {
    var lineNumbers = RegExp("(-?\\d+)");
    List<List<int>> output = Day14input()
        .input
        .split("\n")
        .map((line) => lineNumbers
            .allMatches(line)
            .map((z) => int.parse(z.group(0)!))
            .toList())
        .toList();

    return output;
  }

  String partOne() {
    var bots = readInput();
    var (maxX, maxY) = (101, 103);

    // printMap(maxY, maxX, bots);

    var moveSpaces = 100;
    List<List<int>> newBots = [];
    for (var bot in bots) {
      newBots.add([
        (bot[0] + bot[2] * moveSpaces) % maxX,
        (bot[1] + bot[3] * moveSpaces) % maxY,
        bot[2],
        bot[3]
      ]);
    }
    // print("100 later");
    // printMap(maxY, maxX, newBots);

    int output = safetyFactor(newBots, maxX, maxY);

    return '$output';
  }

  int safetyFactor(List<List<int>> newBots, int maxX, int maxY) {
    var (quad1, quad2, quad3, quad4) = (0, 0, 0, 0);
    for (var bot in newBots) {
      // printMap(maxY, maxX, [bot]);
      if (bot[0] < (maxX - 1) ~/ 2) {
        if (bot[1] < (maxY - 1) ~/ 2) {
          quad1++;
        } else if (bot[1] > (maxY - 1) ~/ 2) {
          quad2++;
        }
      } else if (bot[0] > (maxX - 1) ~/ 2) {
        if (bot[1] < (maxY - 1) ~/ 2) {
          quad3++;
        } else if (bot[1] > (maxY - 1) ~/ 2) {
          quad4++;
        }
      }
    }

    var output = quad1 * quad2 * quad3 * quad4;
    return output;
  }

  String partTwo() {
    var bots = readInput();
    var (maxX, maxY) = (101, 103);

    var moveSpaces = 1;
    var bestMoves = 1;
    List<List<int>> newBots = [];
    var safety = safetyFactor(bots, maxX, maxY);
    while (moveSpaces < 10000) {
      newBots = [];
      for (var bot in bots) {
        newBots.add([
          (bot[0] + bot[2] * moveSpaces) % maxX,
          (bot[1] + bot[3] * moveSpaces) % maxY,
          bot[2],
          bot[3]
        ]);
      }
      var newSafety = safetyFactor(newBots, maxX, maxY);
      if (newSafety < safety) {
        safety = newSafety;
        bestMoves = moveSpaces;
        printMap(maxY, maxX, newBots);
      }
      moveSpaces++;
    }

    return '$bestMoves';
  }

  void printMap(int maxY, int maxX, List<List<int>> input) {
    for (var i = 0; i < maxY; i++) {
      var printLine = "";
      for (var j = 0; j < maxX; j++) {
        if (input.any((bot) => bot[0] == j && bot[1] == i)) {
          printLine += input
              .where((bot) => bot[0] == j && bot[1] == i)
              .length
              .toString();
        } else {
          if (j == (maxX - 1) ~/ 2) {
            printLine += "|";
          } else if (i == (maxY - 1) ~/ 2) {
            printLine += "-";
          } else {
            printLine += ".";
          }
        }
      }
      print("$i: $printLine");
    }
  }
}
