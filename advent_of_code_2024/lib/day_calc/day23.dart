import 'package:adventofcode2024/inputs/day23input.dart';

class Day23Calc {
  Map<String, Set<String>> readInput() {
    List<List<String>> output = Day23input()
        .input
        .split("\n")
        .map((e) => e.split("-").toList())
        .toList();

    Map<String, Set<String>> networkMap = {};
    for (var item in output) {
      networkMap.update(item[0], (value) => value..add(item[1]),
          ifAbsent: () => {item[1]});
      networkMap.update(item[1], (value) => value..add(item[0]),
          ifAbsent: () => {item[0]});
    }

    return networkMap;
  }

  String partOne() {
    var input = readInput();
    var output = 0;

    Set<(String, String, String)> networks = {};

    for (var computer in input.keys) {
      for (var connected in input[computer]!) {
        for (var connected2 in input[connected]!) {
          if (input[computer]!.contains(connected2)) {
            var possibleNetwork = [computer, connected, connected2];
            possibleNetwork.sort();
            var network =
                (possibleNetwork[0], possibleNetwork[1], possibleNetwork[2]);
            if (!networks.contains(network)) {
              networks.add(network);
            }
          }
        }
      }
    }

    output = networks
        .where((element) =>
            element.$1.startsWith("t") ||
            element.$2.startsWith("t") ||
            element.$3.startsWith("t"))
        .length;

    return '$output';
  }

  String partTwo() {
    var input = readInput();

    Set<String> biggestNetwork = {};

    for (var computer in input.keys) {
      var possibleNetwork = input[computer]!;
      var network = {computer};

      while (possibleNetwork.isNotEmpty) {
        var connected = possibleNetwork.first;
        network.add(connected);
        possibleNetwork = possibleNetwork.intersection(input[connected]!);
      }

      if (network.length > biggestNetwork.length) {
        biggestNetwork = network;
      }
    }
    return (biggestNetwork.toList()..sort()).join(",");
  }
}
