import 'package:adventofcode2024/inputs/day21input.dart';

class Day21Calc {
  List<List<String>> readInput() {
    List<List<String>> output = Day21input()
        .input
        .split("\n")
        .map((line) => line.split("").toList())
        .toList();

    return output;
  }

  String partOne() {
    var input = readInput();
    var output = 0;

    for (var line in input) {
      var from = "A";
      var steps1 = "";
      var numberString = "";
      for (var element in line) {
        // for (var fromin in "0123456789A".split("")) {
        //   for (var to in "0123456789A".split("")) {
        steps1 += moveNumber(from, element);
        from = element;
        if (element != "A") {
          numberString += element;
        }
      }
      from = "A";
      var steps2 = "";
      for (var element in steps1.split("")) {
        steps2 += moveCursor(from, element);
        from = element;
      }
      from = "A";
      var steps3 = "";
      for (var element in steps2.split("")) {
        steps3 += moveCursor(from, element);
        from = element;
      }
      from = "A";
      var steps4 = "";
      for (var element in steps3.split("")) {
        steps4 += moveCursor(from, element);
        from = element;
      }

      output += int.parse(numberString) * steps4.length;
    }

    return '$output';
  }

  String partTwo() {
    var input = readInput();
    var output = 0;

    for (var line in input) {
      var from = "A";
      var steps = "";
      var numberString = "";
      for (var element in line) {
        steps += moveNumber(from, element);
        from = element;
        if (element != "A") {
          numberString += element;
        }
      }

      Map<(String, String, int), int> cache = {};

      var instructions = steps.split("");
      var stepsLength = 0;
      from = "A";
      for (var element in instructions) {
        stepsLength += doTheThing(from, element, 26, cache);
        from = element;
      }

      output += int.parse(numberString) * stepsLength;
    }

    return '$output';
  }

  int doTheThing(String from, String element, int depth,
      Map<(String, String, int), int> cache) {
    var cacheKey = (from, element, depth);
    if (cache.containsKey(cacheKey)) {
      return cache[cacheKey]!;
    }
    if (depth == 1) {
      return 1;
    }
    if (from == element) {
      return 1;
    }

    var output = 0;
    var steps = moveCursor(from, element);
    from = "A";
    var instructions = steps.split("");
    for (var newElement in instructions) {
      output += doTheThing(from, newElement, depth - 1, cache);
      from = newElement;
    }
    cache[cacheKey] = output;
    return output;
  }

  String moveNumber(String from, String to) {
    var steps = {
      ("0", "0"): "A",
      ("0", "1"): "^<A",
      ("0", "2"): "^A",
      ("0", "3"): "^>A",
      ("0", "4"): "^^<A",
      ("0", "5"): "^^A",
      ("0", "6"): "^^>A",
      ("0", "7"): "^^^<A",
      ("0", "8"): "^^^A",
      ("0", "9"): "^^^>A",
      ("0", "A"): ">A",
      ("1", "0"): ">vA",
      ("1", "1"): "A",
      ("1", "2"): ">A",
      ("1", "3"): ">>A",
      ("1", "4"): "^A",
      ("1", "5"): "^>A",
      ("1", "6"): "^>>A",
      ("1", "7"): "^^A",
      ("1", "8"): "^^>A",
      ("1", "9"): "^^>>A",
      ("1", "A"): ">>vA",
      ("2", "0"): "vA",
      ("2", "1"): "<A",
      ("2", "2"): "A",
      ("2", "3"): ">A",
      ("2", "4"): "<^A",
      ("2", "5"): "^A",
      ("2", "6"): "^>A",
      ("2", "7"): "<^^A",
      ("2", "8"): "^^A",
      ("2", "9"): "^^>A",
      ("2", "A"): "v>A",
      ("3", "0"): "<vA",
      ("3", "1"): "<<A",
      ("3", "2"): "<A",
      ("3", "3"): "A",
      ("3", "4"): "<<^A",
      ("3", "5"): "<^A",
      ("3", "6"): "^A",
      ("3", "7"): "<<^^A",
      ("3", "8"): "<^^A",
      ("3", "9"): "^^A",
      ("3", "A"): "vA",
      ("4", "0"): "vv>A",
      ("4", "1"): "vA",
      ("4", "2"): "v>A",
      ("4", "3"): "v>>A",
      ("4", "4"): "A",
      ("4", "5"): ">A",
      ("4", "6"): ">>A",
      ("4", "7"): "^A",
      ("4", "8"): "^>A",
      ("4", "9"): "^>>A",
      ("4", "A"): ">>vvA",
      ("5", "0"): "vvA",
      ("5", "1"): "<vA",
      ("5", "2"): "vA",
      ("5", "3"): "v>A",
      ("5", "4"): "<A",
      ("5", "5"): "A",
      ("5", "6"): ">A",
      ("5", "7"): "<^A",
      ("5", "8"): "^A",
      ("5", "9"): "^>A",
      ("5", "A"): "vv>A",
      ("6", "0"): "<vvA",
      ("6", "1"): "<<vA",
      ("6", "2"): "<vA",
      ("6", "3"): "vA",
      ("6", "4"): "<<A",
      ("6", "5"): "<A",
      ("6", "6"): "A",
      ("6", "7"): "<<^A",
      ("6", "8"): "<^A",
      ("6", "9"): "^A",
      ("6", "A"): "vvA",
      ("7", "0"): "vvv>A",
      ("7", "1"): "vvA",
      ("7", "2"): "vv>A",
      ("7", "3"): "vv>>A",
      ("7", "4"): "vA",
      ("7", "5"): "v>A",
      ("7", "6"): "v>>A",
      ("7", "7"): "A",
      ("7", "8"): ">A",
      ("7", "9"): ">>A",
      ("7", "A"): ">>vvvA",
      ("8", "0"): "vvvA",
      ("8", "1"): "<vvA",
      ("8", "2"): "vvA",
      ("8", "3"): "vv>A",
      ("8", "4"): "<vA",
      ("8", "5"): "vA",
      ("8", "6"): "v>A",
      ("8", "7"): "<A",
      ("8", "8"): "A",
      ("8", "9"): ">A",
      ("8", "A"): "vvv>A",
      ("9", "0"): "<vvvA",
      ("9", "1"): "<<vvA",
      ("9", "2"): "<vvA",
      ("9", "3"): "vvA",
      ("9", "4"): "<<vA",
      ("9", "5"): "<vA",
      ("9", "6"): "vA",
      ("9", "7"): "<<A",
      ("9", "8"): "<A",
      ("9", "9"): "A",
      ("9", "A"): "vvvA",
      ("A", "0"): "<A",
      ("A", "1"): "^<<A",
      ("A", "2"): "<^A",
      ("A", "3"): "^A",
      ("A", "4"): "^^<<A",
      ("A", "5"): "<^^A",
      ("A", "6"): "^^A",
      ("A", "7"): "^^^<<A",
      ("A", "8"): "<^^^A",
      ("A", "9"): "^^^A",
      ("A", "A"): "A",
    };
    return steps[(from, to)]!;
  }

  String moveCursor(String from, String to) {
    var steps = {
      ("<", "<"): "A",
      ("<", "v"): ">A",
      ("<", ">"): ">>A",
      ("<", "^"): ">^A",
      ("<", "A"): ">>^A",
      ("v", "<"): "<A",
      ("v", "v"): "A",
      ("v", ">"): ">A",
      ("v", "^"): "^A",
      ("v", "A"): "^>A",
      (">", "<"): "<<A",
      (">", "v"): "<A",
      (">", ">"): "A",
      (">", "^"): "<^A",
      (">", "A"): "^A",
      ("^", "<"): "v<A",
      ("^", "v"): "vA",
      ("^", ">"): "v>A",
      ("^", "^"): "A",
      ("^", "A"): ">A",
      ("A", "<"): "v<<A",
      ("A", "v"): "<vA",
      ("A", ">"): "vA",
      ("A", "^"): "<A",
      ("A", "A"): "A",
    };

    return steps[(from, to)]!;
  }
}
