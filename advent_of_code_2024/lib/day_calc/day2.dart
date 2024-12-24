import 'package:adventofcode2024/inputs/day2input.dart';

class Day2Calc {
  List<List<int>> readInput() {
    List<List<int>> output = List.empty(growable: true);

    final String stringInput = Day2input().input;

    List<String> lineList = stringInput.split('\n');

    for (String line in lineList) {
      output.add(line.split(' ').map(int.parse).toList());
    }

    return output;
  }

  String partOne() {
    int output = 0;
    List<List<int>> inputLists = readInput();

    for (var report in inputLists) {
      var diffList = List.empty(growable: true);
      for (var i = 0; i < report.length - 1; i++) {
        diffList.add(report[i + 1] - report[i]);
      }

      if (diffList.every((diff) => diff < 4 && diff > 0) ||
          diffList.every((diff) => diff > -4 && diff < 0)) {
        output++;
      }
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    List<List<int>> inputLists = readInput();

    for (var report in inputLists) {
      var diffList = List.empty(growable: true);

      for (var i = 0; i < report.length - 1; i++) {
        diffList.add(report[i + 1] - report[i]);
      }

      if (diffList.every((diff) => diff < 4 && diff > 0) ||
          diffList.every((diff) => diff > -4 && diff < 0)) {
        output++;
      } else {
        for (var i = 0; i < report.length; i++) {
          diffList = List.empty(growable: true);
          var testReport = List<int>.from(report)..removeAt(i);

          for (var j = 0; j < testReport.length - 1; j++) {
            diffList.add(testReport[j + 1] - testReport[j]);
          }
          if (diffList.every((diff) => diff < 4 && diff > 0) ||
              diffList.every((diff) => diff > -4 && diff < 0)) {
            output++;
            break;
          }
        }
      }
    }

    return output.toString();
  }
}
