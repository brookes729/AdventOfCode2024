import 'package:adventofcode2024/inputs/day11input.dart';

class Day11Calc {
  List<int> readInput() {
    List<int> output =
        Day11input().input.split(" ").map((x) => int.parse(x)).toList();

    return output;
  }

  String partOne() {
    var input = readInput();
    var output = 0;
    // print(input);

    for (var element in input) {
      output += loop(element, 25, {});
    }

    return output.toString();
  }

  String partTwo() {
    var input = readInput();
    var output = 0;
    // print(input);

    for (var element in input) {
      output += loop(element, 75, {});
    }

    return output.toString();
  }

  int loop(int input, int remainingCount, Map<(int, int), int> cache) {
    if (remainingCount == 0) {
      return 1;
    } else if (cache.containsKey((input, remainingCount))) {
      return cache[(input, remainingCount)]!;
    }
    List<int> newInput = [];
    int output = 0;

    if (input == 0) {
      newInput.add(1);
    } else if (input.toString().length % 2 == 0) {
      var stringElement = input.toString();
      newInput.add(
          int.parse(stringElement.substring(0, stringElement.length ~/ 2)));
      newInput.add(int.parse(stringElement.substring(
          stringElement.length ~/ 2, stringElement.length)));
    } else {
      newInput.add(input * 2024);
    }

    Map<int, int> newCount = {};
    for (int element in newInput) {
      if (!newCount.containsKey(element)) {
        newCount[element] = 1;
      } else {
        newCount[element] = newCount[element]! + 1;
      }
    }

    for (var element in newCount.entries) {
      output += element.value * loop(element.key, remainingCount - 1, cache);
    }

    cache[(input, remainingCount)] = output;
    return output;
  }
}
