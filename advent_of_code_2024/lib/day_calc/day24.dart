import 'package:adventofcode2024/inputs/day24input.dart';

class Day24Calc {
  (Map<String, bool>, Map<String, (String, String, String)>) readInput() {
    List<String> output = Day24input().input.split("\n");

    var valuesDone = false;
    Map<String, bool> values = {};
    Map<String, (String, String, String)> instructions = {};

    for (var line in output) {
      if (line.isEmpty) {
        valuesDone = true;
        continue;
      }
      if (!valuesDone) {
        var parts = line.split(": ");
        values[parts[0]] = parts[1] == "1";
      } else {
        var parts = line.split(" ");
        instructions[parts[4]] = (parts[0], parts[1], parts[2]);
      }
    }

    return (values, instructions);
  }

  String partOne() {
    var (values, instructions) = readInput();

    findZ(instructions, values);

    var output = findLetterValue(values, "z");

    return '$output';
  }

  String partTwo() {
    var (values, instructions) = readInput();

    Map<int, List<(String, String, String, String)>> zElements = {};

    for (var instruction in instructions.entries) {
      var (a, b, c) = instruction.value;
      var elementsToCheck = [];
      if (instruction.key.startsWith("z")) {
        var zNumber = int.parse(instruction.key.toString().substring(1));

        zElements[zNumber] = [(instruction.key, a, b, c)];
        elementsToCheck.add(a);
        elementsToCheck.add(c);

        while (elementsToCheck.isNotEmpty) {
          var element = elementsToCheck.removeAt(0);
          if (instructions.containsKey(element)) {
            var (a, b, c) = instructions[element]!;
            zElements[zNumber]!.add((element, a, b, c));

            elementsToCheck.add(a);
            elementsToCheck.add(c);
          }
        }
      }
    }

    Set badRules = {};

    for (var entry in zElements.entries) {
      if (entry.key == 0) {
        continue;
      }
      for (var element in zElements[entry.key - 1]!) {
        if (!entry.value.contains(element)) {
          badRules.add(element);
        }
      }
    }

    for (var value in values.keys) {
      if (value.startsWith("x")) {
        values[value] = true;
      } else if (value.startsWith("y")) {
        values[value] = false;
      }
    }

    findZ(instructions, values);

    for (var value in values.keys) {
      if (value.startsWith("z")) {
        if (!values[value]!) {
          print(value);
        }
      }
    }

    return '2';
  }

  void findZ(Map<String, (String, String, String)> instructions,
      Map<String, bool> values) {
    while (true) {
      var done = true;
      for (var instruction in instructions.entries) {
        if (values.containsKey(instruction.key)) {
          continue;
        }
        var (a, b, c) = instruction.value;
        if (values.containsKey(a) && values.containsKey(c)) {
          values[instruction.key] = b == "AND"
              ? values[a]! && values[c]!
              : b == "OR"
                  ? values[a]! || values[c]!
                  : values[a]! ^ values[c]!;
        }
        if (instruction.key.startsWith("z")) {
          done = false;
        }
      }
      if (done) {
        break;
      }
    }
  }

  int findLetterValue(Map<String, bool> values, String letterToCalc) {
    var output = 0;
    var i = 0;
    while (true) {
      if (values.containsKey("$letterToCalc$i")) {
        if (values["$letterToCalc$i"]!) {
          output += 1 << i;
        }
      } else if (values.containsKey("${letterToCalc}0$i")) {
        if (values["${letterToCalc}0$i"]!) {
          output += 1 << i;
        }
      } else {
        break;
      }
      i++;
    }
    return output;
  }
}
