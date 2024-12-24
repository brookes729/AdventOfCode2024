import 'package:adventofcode2024/day_calc/day0.dart';
import 'package:adventofcode2024/day_calc/day1.dart';
import 'package:adventofcode2024/day_calc/day10.dart';
import 'package:adventofcode2024/day_calc/day11.dart';
import 'package:adventofcode2024/day_calc/day12.dart';
import 'package:adventofcode2024/day_calc/day13.dart';
import 'package:adventofcode2024/day_calc/day14.dart';
import 'package:adventofcode2024/day_calc/day15.dart';
import 'package:adventofcode2024/day_calc/day16.dart';
import 'package:adventofcode2024/day_calc/day17.dart';
import 'package:adventofcode2024/day_calc/day18.dart';
import 'package:adventofcode2024/day_calc/day19.dart';
import 'package:adventofcode2024/day_calc/day2.dart';
import 'package:adventofcode2024/day_calc/day20.dart';
import 'package:adventofcode2024/day_calc/day21.dart';
import 'package:adventofcode2024/day_calc/day22.dart';
import 'package:adventofcode2024/day_calc/day23.dart';
import 'package:adventofcode2024/day_calc/day24.dart';
import 'package:adventofcode2024/day_calc/day3.dart';
import 'package:adventofcode2024/day_calc/day4.dart';
import 'package:adventofcode2024/day_calc/day5.dart';
import 'package:adventofcode2024/day_calc/day6.dart';
import 'package:adventofcode2024/day_calc/day7.dart';
import 'package:adventofcode2024/day_calc/day8.dart';
import 'package:adventofcode2024/day_calc/day9.dart';

class DayCalc {
  String calculate(int day, int part) {
    switch (day) {
      case 0:
        switch (part) {
          case 1:
            return Day0Calc().partOne();
          case 2:
            return Day0Calc().partTwo();
        }
      case 1:
        switch (part) {
          case 1:
            return Day1Calc().partOne();
          case 2:
            return Day1Calc().partTwo();
        }
      case 2:
        switch (part) {
          case 1:
            return Day2Calc().partOne();
          case 2:
            return Day2Calc().partTwo();
        }
      case 3:
        switch (part) {
          case 1:
            return Day3Calc().partOne();
          case 2:
            return Day3Calc().partTwo();
        }
      case 4:
        switch (part) {
          case 1:
            return Day4Calc().partOne();
          case 2:
            return Day4Calc().partTwo();
        }
      case 5:
        switch (part) {
          case 1:
            return Day5Calc().partOne();
          case 2:
            return Day5Calc().partTwo();
        }
      case 6:
        switch (part) {
          case 1:
            return Day6Calc().partOne();
          case 2:
            return Day6Calc().partTwo();
        }
      case 7:
        switch (part) {
          case 1:
            return Day7Calc().partOne();
          case 2:
            return Day7Calc().partTwo();
        }
      case 8:
        switch (part) {
          case 1:
            return Day8Calc().partOne();
          case 2:
            return Day8Calc().partTwo();
        }
      case 9:
        switch (part) {
          case 1:
            return Day9Calc().partOne();
          case 2:
            return Day9Calc().partTwo();
        }
      case 10:
        switch (part) {
          case 1:
            return Day10Calc().partOne();
          case 2:
            return Day10Calc().partTwo();
        }
      case 11:
        switch (part) {
          case 1:
            return Day11Calc().partOne();
          case 2:
            return Day11Calc().partTwo();
        }
      case 12:
        switch (part) {
          case 1:
            return Day12Calc().partOne();
          case 2:
            return Day12Calc().partTwo();
        }
      case 13:
        switch (part) {
          case 1:
            return Day13Calc().partOne();
          case 2:
            return Day13Calc().partTwo();
        }
      case 14:
        switch (part) {
          case 1:
            return Day14Calc().partOne();
          case 2:
            return Day14Calc().partTwo();
        }
      case 15:
        switch (part) {
          case 1:
            return Day15Calc().partOne();
          case 2:
            return Day15Calc().partTwo();
        }
      case 16:
        switch (part) {
          case 1:
            return Day16Calc().partOne();
          case 2:
            return Day16Calc().partTwo();
        }
      case 17:
        switch (part) {
          case 1:
            return Day17Calc().partOne();
          case 2:
            return Day17Calc().partTwo();
        }
      case 18:
        switch (part) {
          case 1:
            return Day18Calc().partOne();
          case 2:
            return Day18Calc().partTwo();
        }
      case 19:
        switch (part) {
          case 1:
            return Day19Calc().partOne();
          case 2:
            return Day19Calc().partTwo();
        }
      case 20:
        switch (part) {
          case 1:
            return Day20Calc().partOne();
          case 2:
            return Day20Calc().partTwo();
        }
      case 21:
        switch (part) {
          case 1:
            return Day21Calc().partOne();
          case 2:
            return Day21Calc().partTwo();
        }
      case 22:
        switch (part) {
          case 1:
            return Day22Calc().partOne();
          case 2:
            return Day22Calc().partTwo();
        }
      case 23:
        switch (part) {
          case 1:
            return Day23Calc().partOne();
          case 2:
            return Day23Calc().partTwo();
        }
      case 24:
        switch (part) {
          case 1:
            return Day24Calc().partOne();
          case 2:
            return Day24Calc().partTwo();
        }
    }
    return 'You\'re too early';
  }
}
