import 'package:adventofcode2024/inputs/day15input.dart';

class Day15Calc {
  (List<List<String>>, List<String>, (int, int)) readInput() {
    List<String> input = Day15input().input.split("\n");
    List<List<String>> map = [];
    List<String> directions = [];
    var (botX, botY) = (0, 0);

    bool isDirections = false;
    for (var line in input) {
      if (!isDirections) {
        if (line.isEmpty) {
          isDirections = true;
          continue;
        }
        if (line.contains("@")) {
          botX = map.length; // x down
          botY = line.indexOf("@"); // y right
        }
        map.add(line.split("").toList());
      } else {
        directions.addAll(line.split(""));
      }
    }

    return (map, directions, (botX, botY));
  }

  String partOne() {
    var (map, directions, (botX, botY)) = readInput();
    var output = 0;

    for (var direction in directions) {
      (_, botX, botY) = move(map, direction, botX, botY, false);
      // printMap(map);
    }

    // printMap(map);

    for (var i = 0; i < map.length; i++) {
      for (var j = 0; j < map[i].length; j++) {
        if (map[i][j] == "O") {
          output += i * 100 + j;
        }
      }
    }

    return '$output';
  }

  String partTwo() {
    var (map, directions, (botX, botY)) = readInput();
    var output = 0;

    // widen our map
    List<List<String>> newMap = [];
    for (var row in map) {
      List<String> newRow = [];
      for (var cell in row) {
        switch (cell) {
          case "#":
            newRow.addAll(["#", "#"]);
            break;
          case "O":
            newRow.addAll(["[", "]"]);
            break;
          case ".":
            newRow.addAll([".", "."]);
            break;
          case "@":
            newRow.addAll(["@", "."]);
            break;
          default:
        }
      }
      newMap.add(newRow);
    }

    botY = 2 * botY;

    for (var direction in directions) {
      (_, botX, botY) = move(newMap, direction, botX, botY, false);
    }

    for (var i = 0; i < newMap.length; i++) {
      for (var j = 0; j < newMap[i].length; j++) {
        if (newMap[i][j] == "[") {
          output += i * 100 + j;
        }
      }
    }

    return '$output';
  }

  (bool, int, int) move(List<List<String>> map, String direction, int botX,
      int botY, bool checkOnly) {
    var (newBotX, newBotY) = (botX, botY);
    var vertical = false;

    switch (direction) {
      case "<":
        newBotY--;
        break;
      case "^":
        newBotX--;
        vertical = true;
        break;
      case ">":
        newBotY++;
        break;
      case "v":
        newBotX++;
        vertical = true;
        break;
      default:
    }
    if (map[newBotX][newBotY] == "#") {
      return (false, botX, botY);
    } else if (map[newBotX][newBotY] == ".") {
      if (!checkOnly) {
        map[newBotX][newBotY] = map[botX][botY];
        map[botX][botY] = ".";
        if (map[botX][botY] == "@") {
          map[botX][botY] = ".";
        } else if (map[newBotX][newBotY] == "[") {
          if (vertical && map[botX][newBotY + 1] != ".") {
            move(map, direction, botX, newBotY + 1, false);
          } else {
            map[botX][newBotY + 1] = ".";
            map[newBotX][newBotY + 1] = "]";
          }
        } else if (map[newBotX][newBotY] == "]") {
          if (vertical && map[botX][newBotY - 1] != ".") {
            move(map, direction, botX, newBotY - 1, false);
          } else {
            map[botX][newBotY - 1] = ".";
            map[newBotX][newBotY - 1] = "[";
          }
        }
      }
      return (true, newBotX, newBotY);
    } else if (!vertical ||
        (map[newBotX][newBotY] != "[" && map[newBotX][newBotY] != "]")) {
      if (move(map, direction, newBotX, newBotY, checkOnly).$1) {
        if (!checkOnly) {
          map[newBotX][newBotY] = map[botX][botY];
          map[botX][botY] = ".";
          if (map[botX][botY] == "@") {
            map[botX][botY] = ".";
          } else if (map[newBotX][newBotY] == "[") {
            if (vertical && map[botX][newBotY + 1] != ".") {
              move(map, direction, botX, newBotY + 1, false);
            } else {
              map[botX][newBotY + 1] = ".";
              map[newBotX][newBotY + 1] = "]";
            }
          } else if (map[newBotX][newBotY] == "]") {
            if (vertical && map[botX][newBotY - 1] != ".") {
              move(map, direction, botX, newBotY - 1, false);
            } else {
              map[botX][newBotY - 1] = ".";
              map[newBotX][newBotY - 1] = "[";
            }
          }
        }
        return (true, newBotX, newBotY);
      } else {
        return (false, botX, botY);
      }
    } else {
      // moving up and down with a side of a box here
      var (canMoveLeft, canMoveRight) = (false, false);
      if (map[newBotX][newBotY] == "[") {
        // check if we can move box in direction including botY + 1
        canMoveLeft = move(map, direction, newBotX, newBotY, true).$1;
        canMoveRight = move(map, direction, newBotX, newBotY + 1, true).$1;
        if (!checkOnly && canMoveLeft && canMoveRight) {
          move(map, direction, newBotX, newBotY, false);

          if (map[newBotX][newBotY + 1] != ".") {
            move(map, direction, botX, newBotY + 1, false);
          }
          map[newBotX][newBotY] = map[botX][botY];
          map[botX][botY] = ".";
          if (map[botX][botY] == "@") {
            map[botX][botY] = ".";
            map[newBotX][botY + 1] = ".";
          } else if (map[newBotX][newBotY] == "[") {
            if (map[botX][newBotY + 1] != ".") {
              move(map, direction, botX, newBotY + 1, false);
            } else {
              map[botX][newBotY + 1] = ".";
              map[newBotX][newBotY + 1] = "]";
            }
          } else if (map[newBotX][newBotY] == "]") {
            if (map[botX][newBotY - 1] != ".") {
              move(map, direction, botX, newBotY - 1, false);
            } else {
              map[botX][newBotY - 1] = ".";
              map[newBotX][newBotY - 1] = "[";
            }
          }
        }
      } else if (map[newBotX][newBotY] == "]") {
        // check if we can move box in direction including botY - 1
        canMoveLeft = move(map, direction, newBotX, newBotY - 1, true).$1;
        canMoveRight = move(map, direction, newBotX, newBotY, true).$1;
        if (!checkOnly && canMoveLeft && canMoveRight) {
          move(map, direction, newBotX, newBotY, false);
          if (map[newBotX][newBotY - 1] != ".") {
            move(map, direction, newBotX, newBotY - 1, false);
          }
          map[newBotX][newBotY] = map[botX][botY];
          map[botX][botY] = ".";

          if (map[botX][botY] == "@") {
            map[newBotX][botY - 1] = ".";
            map[botX][botY] = ".";
          } else if (map[newBotX][newBotY] == "[") {
            if (map[botX][newBotY + 1] != ".") {
              move(map, direction, botX, newBotY + 1, false);
            } else {
              map[botX][newBotY + 1] = ".";
              map[newBotX][newBotY + 1] = "]";
            }
          } else if (map[newBotX][newBotY] == "]") {
            if (map[botX][newBotY - 1] != ".") {
              move(map, direction, botX, newBotY - 1, false);
            } else {
              map[botX][newBotY - 1] = ".";
              map[newBotX][newBotY - 1] = "[";
            }
          }
        }
      }
      if (canMoveLeft && canMoveRight) {
        return (true, newBotX, newBotY);
      } else {
        return (false, botX, botY);
      }
    }
  }

  void printMap(List<List<String>> input) {
    for (var i = 0; i < input.length; i++) {
      print("$i: ${input[i].join("")}");
    }
  }
}
