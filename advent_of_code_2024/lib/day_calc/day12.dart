import 'package:adventofcode2024/inputs/day12input.dart';

class Day12Calc {
  List<List<String>> readInput() {
    List<List<String>> output =
        Day12input().input.split("\n").map(((x) => x.split(""))).toList();

    return output;
  }

  String partOne() {
    var input = readInput();
    var output = 0;
    Set<(int, int)> visted = {};

    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input[i].length; j++) {
        if (visted.contains((i, j))) {
          continue;
        }
        var (perimeter, area) = floodFill(input, i, j, visted, {});
        output += perimeter * area;
      }
    }

    return '$output';
  }

  String partTwo() {
    var input = readInput();
    var output = 0;
    Set<(int, int)> visted = {};

    for (var i = 0; i < input.length; i++) {
      for (var j = 0; j < input[i].length; j++) {
        if (visted.contains((i, j))) {
          continue;
        }
        Set<((int, int), (int, int))> visitedPerimeter = {};
        var (_, area) = floodFill(input, i, j, visted, visitedPerimeter);

        var edgeCount = 0;

        while (visitedPerimeter.isNotEmpty) {
          edgeCount++;
          var edge = visitedPerimeter.first;
          visitedPerimeter.remove(edge);

          if (edge.$1.$1 == edge.$2.$1) {
            // Same i check left and right
            var test = 1;
            while (visitedPerimeter.contains((
              (edge.$1.$1 + test, edge.$1.$2),
              (edge.$2.$1 + test, edge.$2.$2)
            ))) {
              visitedPerimeter.remove((
                (edge.$1.$1 + test, edge.$1.$2),
                (edge.$2.$1 + test, edge.$2.$2)
              ));
              test++;
            }
            test = 1;
            while (visitedPerimeter.contains((
              (edge.$1.$1 - test, edge.$1.$2),
              (edge.$2.$1 - test, edge.$2.$2)
            ))) {
              visitedPerimeter.remove((
                (edge.$1.$1 - test, edge.$1.$2),
                (edge.$2.$1 - test, edge.$2.$2)
              ));
              test++;
            }
          } else {
            // Same j check up and down
            var test = 1;
            while (visitedPerimeter.contains((
              (edge.$1.$1, edge.$1.$2 + test),
              (edge.$2.$1, edge.$2.$2 + test)
            ))) {
              visitedPerimeter.remove((
                (edge.$1.$1, edge.$1.$2 + test),
                (edge.$2.$1, edge.$2.$2 + test)
              ));
              test++;
            }
            test = 1;
            while (visitedPerimeter.contains((
              (edge.$1.$1, edge.$1.$2 - test),
              (edge.$2.$1, edge.$2.$2 - test)
            ))) {
              visitedPerimeter.remove((
                (edge.$1.$1, edge.$1.$2 - test),
                (edge.$2.$1, edge.$2.$2 - test)
              ));
              test++;
            }
          }
        }
        output += edgeCount * area;
      }
    }

    return '$output';
  }

  (int, int) floodFill(List<List<String>> input, int i, int j,
      Set<(int, int)> visited, Set<((int, int), (int, int))> visitedPerimeter) {
    var (perimeter, area, edge) = (0, 1, 0);

    visited.add((i, j));

    if (input.length > i + 1 && input[i][j] == input[i + 1][j]) {
      if (!visited.contains((i + 1, j))) {
        var (floodedPerimiter, floodedArea) =
            floodFill(input, i + 1, j, visited, visitedPerimeter);
        area += floodedArea;
        perimeter += floodedPerimiter;
      }
    } else {
      perimeter++;
      visitedPerimeter.add(((i, j), (i + 1, j)));
    }
    if (i - 1 > -1 && input[i][j] == input[i - 1][j]) {
      if (!visited.contains((i - 1, j))) {
        var (floodedPerimiter, floodedArea) =
            floodFill(input, i - 1, j, visited, visitedPerimeter);
        area += floodedArea;
        perimeter += floodedPerimiter;
      }
    } else {
      perimeter++;
      visitedPerimeter.add(((i, j), (i - 1, j)));
    }
    if (input[i].length > j + 1 && input[i][j] == input[i][j + 1]) {
      if (!visited.contains((i, j + 1))) {
        var (floodedPerimiter, floodedArea) =
            floodFill(input, i, j + 1, visited, visitedPerimeter);
        area += floodedArea;
        perimeter += floodedPerimiter;
      }
    } else {
      perimeter++;
      visitedPerimeter.add(((i, j), (i, j + 1)));
    }
    if (j - 1 > -1 && input[i][j] == input[i][j - 1]) {
      if (!visited.contains((i, j - 1))) {
        var (floodedPerimiter, floodedArea) =
            floodFill(input, i, j - 1, visited, visitedPerimeter);
        area += floodedArea;
        perimeter += floodedPerimiter;
      }
    } else {
      perimeter++;
      visitedPerimeter.add(((i, j), (i, j - 1)));
    }

    return (perimeter, area);
  }
}
