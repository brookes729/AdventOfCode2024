import 'dart:math';

import 'package:adventofcode2024/inputs/day17input.dart';

class Day17Calc {
  (int, int, int, List<int>) readInput() {
    List<String> input = Day17input().input.split("\n");

    var numberFinder = RegExp(r"\d+");
    var a = int.parse(numberFinder.firstMatch(input[0])!.group(0)!);
    var b = int.parse(numberFinder.firstMatch(input[1])!.group(0)!);
    var c = int.parse(numberFinder.firstMatch(input[2])!.group(0)!);

    var commands = numberFinder
        .allMatches(input[4])
        .map((match) => int.parse(match.group(0)!))
        .toList();

    return (a, b, c, commands);
  }

  String partOne() {
    var (a, b, c, commands) = readInput();
    List<int> output = [];

    output = runProgram(commands, a, b, c);

    return output.join(",");
  }

  List<int> runProgram(List<int> commands, int a, int b, int c) {
    List<int> output = [];
    for (var i = 0; i < commands.length; i += 2) {
      var (opCode, operand) = (commands[i], commands[i + 1]);
      switch (opCode) {
        case 0:
          // adv - A = A / 2^combo
          a = a ~/ pow(2, combo(operand, a, b, c));
          break;
        case 1:
          // bxl - B = B XOR literal
          b = b ^ operand;
          break;
        case 2:
          // bst - B = combo % 8
          b = combo(operand, a, b, c) % 8;
          break;
        case 3:
          // jnz - if A nothing else move to operand (-2 due to loop)
          i = a == 0 ? i : operand - 2;
          break;
        case 4:
          // bxc - B = B XOR C
          b = b ^ c;
          break;
        case 5:
          // out combo mod 8
          output.add(combo(operand, a, b, c) % 8);
          break;
        case 6:
          // bdv - B = A / 2^combo
          b = a ~/ pow(2, combo(operand, a, b, c));
          break;
        case 7:
          // cdv - C = A / 2^combo
          c = a ~/ pow(2, combo(operand, a, b, c));
          break;
        default:
      }
    }
    return output;
  }

  int combo(int operand, int a, int b, int c) {
    var output = 0;

    switch (operand) {
      case 0:
      case 1:
      case 2:
      case 3:
        output = operand;
        break;
      case 4:
        output = a;
        break;
      case 5:
        output = b;
        break;
      case 6:
        output = c;
      default:
    }

    return output;
  }

  String partTwo() {
    var (a, b, c, commands) = readInput();
    List<int> output = [];

    a = 0;
    var test = 1;

    while (a < 1000000000000000) {
      var target = commands.reversed.take(test).toList().reversed.toList();

      while (!listEquals(output, target) && a < 1000000000000000) {
        a++;
        b = 0;
        c = 0;
        output = runProgram(commands, a, b, c);
      }
      print("$target =>: $a");

      if (test == commands.length) {
        break;
      }
      test++;
      a = (a * 8) - 1;
    }
    return "$a";
  }

  bool listEquals(List<int> output, List<int> commands) {
    var equal = true;
    if (output.length != commands.length) {
      equal = false;
    } else {
      for (var i = 0; i < output.length; i++) {
        if (output[i] != commands[i]) {
          equal = false;
          break;
        }
      }
    }

    return equal;
  }
}
