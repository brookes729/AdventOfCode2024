import 'package:adventofcode2024/inputs/day19input.dart';

class Day19Calc {
  (Map<String, List<String>>, List<String>) readInput() {
    List<String> output = Day19input().input.split("\n");

    Map<String, List<String>> towelMap = {};
    for (var t in output[0].split(", ")) {
      towelMap.update(t[0], (list) => list..add(t), ifAbsent: () => [t]);
    }

    return (towelMap, output.skip(2).toList());
  }

  String partOne() {
    var (towels, patterns) = readInput();
    var output = 0;
    Map<String, (bool, int)> cache = {};

    for (var pattern in patterns) {
      var (match, _) = patternMatch(pattern, towels, cache);
      if (match) {
        output++;
      }
    }

    return "$output";
  }

  String partTwo() {
    var (towels, patterns) = readInput();
    var output = 0;
    Map<String, (bool, int)> cache = {};

    for (var pattern in patterns) {
      var (match, count) = patternMatch(pattern, towels, cache);
      if (match) {
        output += count;
      }
    }

    return "$output";
  }

  (bool, int) patternMatch(String pattern, Map<String, List<String>> towels,
      Map<String, (bool, int)> cache) {
    if (pattern.isEmpty) {
      return (true, 1);
    }

    if (towels[pattern[0]] == null) {
      return (false, 0);
    }

    if (cache.containsKey(pattern)) {
      return cache[pattern]!;
    }

    var match = false;
    var count = 0;

    for (var towel in towels[pattern[0]]!) {
      if (pattern.startsWith(towel)) {
        var newCount = 0;
        var newMatch = false;
        (newMatch, newCount) =
            patternMatch(pattern.substring(towel.length), towels, cache);
        match |= newMatch;
        if (newMatch) {
          count += newCount;
        }
      }
    }

    cache[pattern] = (match, count);

    return (match, count);
  }
}
