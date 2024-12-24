import 'package:adventofcode2024/inputs/day8input.dart';

class Day8Calc {
  (Map<String, List<(int, int)>>, (int, int)) readInput() {
    String input = Day8input().input;

    Map<int, String> rows = input.split("\n").asMap();

    Map<String, List<(int, int)>> output = {};

    for (var row in rows.entries) {
      for (var col in row.value.split("").asMap().entries) {
        if (col.value != ".") {
          if (output.containsKey(col.value)) {
            output[col.value]!.add((row.key, col.key));
          } else {
            output[col.value] = [(row.key, col.key)];
          }
        }
      }
    }

    return (output, (rows.length, rows[0]!.length));
  }

  String partOne() {
    Set<(int, int)> output = {};
    var (input, (maxX, maxY)) = readInput();

    for (var antennaEntry in input.entries) {
      for (var i = 0; i < antennaEntry.value.length; i++) {
        for (var j = i + 1; j < antennaEntry.value.length; j++) {
          // compare the antenna i to j and set antinodes
          var (antennaIX, antennaIY) = antennaEntry.value[i];
          var (antennaJX, antennaJY) = antennaEntry.value[j];
          var dX = antennaIX - antennaJX;
          var dY = antennaIY - antennaJY;
          if (antennaIX + dX < maxX &&
              antennaIX + dX >= 0 &&
              antennaIY + dY < maxY &&
              antennaIY + dY >= 0) {
            output.add((antennaIX + dX, antennaIY + dY));
          }
          if (antennaJX - dX < maxX &&
              antennaJX - dX >= 0 &&
              antennaJY - dY < maxY &&
              antennaJY - dY >= 0) {
            output.add((antennaJX - dX, antennaJY - dY));
          }
        }
      }
    }

    return output.length.toString();
  }

  String partTwo() {
    Set<(int, int)> output = {};
    var (input, (maxX, maxY)) = readInput();

    for (var antennaEntry in input.entries) {
      for (var i = 0; i < antennaEntry.value.length; i++) {
        for (var j = i + 1; j < antennaEntry.value.length; j++) {
          // compare the antenna i to j and set antinodes
          var (antennaIX, antennaIY) = antennaEntry.value[i];
          var (antennaJX, antennaJY) = antennaEntry.value[j];
          var dX = antennaIX - antennaJX;
          var dY = antennaIY - antennaJY;

          // include the antennas
          output.add((antennaIX, antennaIY));
          output.add((antennaJX, antennaJY));

          while (antennaIX + dX < maxX &&
              antennaIX + dX >= 0 &&
              antennaIY + dY < maxY &&
              antennaIY + dY >= 0) {
            antennaIX += dX;
            antennaIY += dY;
            output.add((antennaIX, antennaIY));
          }
          while (antennaJX - dX < maxX &&
              antennaJX - dX >= 0 &&
              antennaJY - dY < maxY &&
              antennaJY - dY >= 0) {
            antennaJX -= dX;
            antennaJY -= dY;
            output.add((antennaJX, antennaJY));
          }
        }
      }
    }

    return output.length.toString();
  }
}
