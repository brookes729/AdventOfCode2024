import 'dart:math';

import 'package:adventofcode2024/inputs/day5input.dart';

class Day5Calc {
  (Map<int, Set<int>>, List<List<int>>) readInput() {
    String input = Day5input().input;
    Map<int, Set<int>> rules = {};
    List<List<int>> manuals = List.empty(growable: true);

    bool rulesComplete = false;
    for (String line in input.split("\n")) {
      if (line == "") {
        rulesComplete = true;
      } else if (!rulesComplete) {
        int first = int.parse(line.split("|")[0]);
        int second = int.parse(line.split("|")[1]);
        if (rules.containsKey(first)) {
          rules[first]!.add(second);
        } else {
          rules[first] = {second};
        }
      } else {
        manuals.add(line.split(",").map((String x) => int.parse(x)).toList());
      }
    }

    return (rules, manuals);
  }

  String partOne() {
    int output = 0;
    var (rules, manuals) = readInput();

    for (List<int> manual in manuals) {
      Set<int> vistedPages = {};
      bool valid = true;
      for (int page in manual) {
        if (rules.containsKey(page) &&
            vistedPages.intersection(rules[page]!).isNotEmpty) {
          valid = false;
          break;
        }
        vistedPages.add(page);
      }
      if (valid) {
        output += manual[(manual.length ~/ 2)];
      }
    }

    return output.toString();
  }

  String partTwo() {
    int output = 0;
    var (rules, manuals) = readInput();
    List<int> vistedPages = [];

    for (List<int> manual in manuals) {
      vistedPages = [];
      bool ruleFailed = false;
      for (int page in manual) {
        if (rules.containsKey(page) &&
            vistedPages.toSet().intersection(rules[page]!).isNotEmpty) {
          ruleFailed = true;
          int earliestIndex = vistedPages.length;
          for (int successor in rules[page]!) {
            earliestIndex = vistedPages.contains(successor)
                ? min(earliestIndex, vistedPages.indexOf(successor))
                : earliestIndex;
          }
          vistedPages.insert(earliestIndex, page);
        } else {
          vistedPages.add(page);
        }
      }
      if (ruleFailed) {
        output += vistedPages[(vistedPages.length ~/ 2)];
      }
    }

    return output.toString();
  }
}
