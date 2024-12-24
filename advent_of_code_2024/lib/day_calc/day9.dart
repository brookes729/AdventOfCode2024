import 'package:adventofcode2024/inputs/day9input.dart';

class Day9Calc {
  List<int> readInput() {
    var input =
        Day9input().input.split("").map((String x) => int.parse(x)).toList();

    return input;
  }

  String partOne() {
    int output = 0;
    List<int> input = readInput();

    bool isFile = true;
    int fileCounter = 0;
    int reverseFileIndex = input.length - 1;
    int checkSumIndex = 0;

    for (var i = 0; i < input.length; i++) {
      if (isFile) {
        for (var j = 0; j < input[i]; j++) {
          output += checkSumIndex * fileCounter;
          checkSumIndex++;
        }
        input[i] = 0;
        fileCounter++;
        if (reverseFileIndex < i) {
          break;
        }
      } else {
        if (reverseFileIndex < i) {
          isFile = !isFile;
          continue;
        } else {
          int required = input[i];
          while (required > 0) {
            if (input[reverseFileIndex] > required) {
              for (var j = 0; j < required; j++) {
                output += checkSumIndex * reverseFileIndex ~/ 2;
                checkSumIndex++;
              }
              input[reverseFileIndex] -= required;
              break;
            } else {
              for (var j = 0; j < input[reverseFileIndex]; j++) {
                output += checkSumIndex * reverseFileIndex ~/ 2;
                checkSumIndex++;
              }
              required -= input[reverseFileIndex];
              input[reverseFileIndex] = 0;
              reverseFileIndex -= 2;
            }
          }
        }
      }
      isFile = !isFile;
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    List<(int, int)> input = readInput()
        .asMap()
        .entries
        .map((x) => (x.key % 2 != 0 ? -1 : x.key ~/ 2, x.value))
        .toList();

    for (var i = input.length - 1; i > -1; i -= 2) {
      int check = 1;
      if (input[i].$2 == 0) {
        continue;
      }
      while (check < i) {
        if (input[check].$2 >= input[i].$2) {
          input[check] = (-1, input[check].$2 - input[i].$2);
          input.insert(check, (input[i].$1, input[i].$2));
          input.insert(check, (-1, 0)); // Keep the order
          i += 2; // we increased the size of input
          input[i] = (-1, input[i].$2);
          input.insert(i, (-1, 0)); // Keep the order
          break;
        }
        check += 2;
      }
    }

    List<int> expandedList2 = [];
    for (var i = 0; i < input.length; i++) {
      expandedList2.addAll(List.generate(input[i].$2, (j) => input[i].$1));
    }

    for (var i = 0; i < expandedList2.length; i++) {
      if (expandedList2[i] > -1) {
        output += expandedList2[i] * i;
      }
    }
    return output.toString();
  }
}
