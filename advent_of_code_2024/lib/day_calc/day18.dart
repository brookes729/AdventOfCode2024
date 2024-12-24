import 'package:adventofcode2024/inputs/day18input.dart';

class Day18Calc {
  Set<(int, int)> readInput() {
    Set<(int, int)> output = Day18input()
        .input
        .split("\n")
        .map((line) => line.split(",").map(int.parse).toList())
        .map((list) => (list[0], list[1]))
        .toSet();

    return output;
  }

  String partOne() {
    var input = readInput().take(1024).toSet();
    var (moves, _) = explore(input);

    return '$moves';
  }

  (int, bool) explore(Set<(int, int)> input) {
    var maxSize = 71;

    var states = {
      0: {(0, 0)}
    };
    var moves = 0;
    Set<(int, int)> visited = {};

    while (states.isNotEmpty && moves < 100000) {
      if (!states.containsKey(moves)) {
        moves++;
        continue;
      } else if (states[moves]!.isEmpty) {
        // printMap(maxSize, visited, input);
        states.remove(moves);
        moves++;
        continue;
      }

      var state = states[moves]!.first;
      states[moves]!.remove(state);
      if (state.$1 == maxSize - 1 && state.$2 == maxSize - 1) {
        return (moves, true);
      }

      if (visited.contains(state)) {
        continue;
      }
      visited.add(state);

      for (var dX in [-1, 1]) {
        if (state.$1 + dX > -1 &&
            state.$1 + dX < maxSize &&
            !input.contains((state.$1 + dX, state.$2))) {
          states.update(
              moves + 1, (list) => list..add((state.$1 + dX, state.$2)),
              ifAbsent: () => {(state.$1 + dX, state.$2)});
        }
      }
      for (var dY in [-1, 1]) {
        if (state.$2 + dY > -1 &&
            state.$2 + dY < maxSize &&
            !input.contains((state.$1, state.$2 + dY))) {
          states.update(
              moves + 1, (list) => list..add((state.$1, state.$2 + dY)),
              ifAbsent: () => {(state.$1, state.$2 + dY)});
        }
      }
    }
    return (0, false);
  }

  String partTwo() {
    var input = readInput();
    var success = true;

    var i = 1024;

    for (i = 1024; i < input.length; i++) {
      var testInput = readInput().take(i).toSet();
      (_, success) = explore(testInput);
      if (!success) {
        break;
      }
    }

    return '${input.take(i).last}';
  }

  void printMap(int maxSize, Set<(int, int)> visited, List<(int, int)> input) {
    for (var y = 0; y < maxSize; y++) {
      var line = "$y: ";
      for (var x = 0; x < maxSize; x++) {
        line += visited.contains((x, y))
            ? "O"
            : input.contains((x, y))
                ? "#"
                : ".";
      }
      print(line);
    }
  }
}
