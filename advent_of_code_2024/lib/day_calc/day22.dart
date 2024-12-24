import 'package:adventofcode2024/inputs/day22input.dart';

class Day22Calc {
  List<int> readInput() {
    List<int> output = Day22input().input.split("\n").map(int.parse).toList();

    return output;
  }

  String partOne() {
    var input = readInput();
    var output = 0;

    for (var secretNumber in input) {
      for (var i = 0; i < 2000; i++) {
        secretNumber = nextSecretNumber(secretNumber);
      }
      output += secretNumber;
    }

    return '$output';
  }

  String partTwo() {
    var input = readInput();
    var output = 0;

    List<Map<(int, int, int, int), int>> priceLists = [];

    for (var secretNumber in input) {
      List<int> secretChanges = [];
      Map<(int, int, int, int), int> price = {};
      var lastValue = secretNumber % 10;
      for (var i = 0; i < 2000; i++) {
        secretNumber = nextSecretNumber(secretNumber);
        secretChanges.add((secretNumber % 10) - lastValue);
        if (secretChanges.length > 4) {
          price.update((
            secretChanges[secretChanges.length - 4],
            secretChanges[secretChanges.length - 3],
            secretChanges[secretChanges.length - 2],
            secretChanges[secretChanges.length - 1]
          ), (val) => val, ifAbsent: () => (secretNumber % 10));
        }
        lastValue = secretNumber % 10;
      }
      priceLists.add(price);
    }

    for (var price in priceLists[0].entries) {
      var bananas = price.value;
      for (var i = 1; i < priceLists.length; i++) {
        if (priceLists[i].containsKey(price.key)) {
          bananas += priceLists[i][price.key]!;
        }
      }
      if (bananas > output) {
        output = bananas;
      }
    }

    return '$output';
  }

  int nextSecretNumber(int secretNumber) {
    // multiply by 64, XOR secretNumber, modulo 16777216
    secretNumber = ((secretNumber * 64) ^ secretNumber) % 16777216;
    // divide by 32 floor it, XOR secretNumber modulo 16777216
    secretNumber = ((secretNumber ~/ 32) ^ secretNumber) % 16777216;
    // multiply by 2048 XOR secretNumber modulo 16777216
    secretNumber = ((secretNumber * 2048) ^ secretNumber) % 16777216;
    return secretNumber;
  }
}
