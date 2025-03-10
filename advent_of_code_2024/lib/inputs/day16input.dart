final class Day16input {
//   final String input = """#################
// #...#...#...#..E#
// #.#.#.#.#.#.#.#.#
// #.#.#.#...#...#.#
// #.#.#.#.###.#.#.#
// #...#.#.#.....#.#
// #.#.#.#.#.#####.#
// #.#...#.#.#.....#
// #.#.#####.#.###.#
// #.#.#.......#...#
// #.#.###.#####.###
// #.#.#...#.....#.#
// #.#.#.#####.###.#
// #.#.#.........#.#
// #.#.#.#########.#
// #S#.............#
// #################""";

  final String input =
      """#############################################################################################################################################
#.............#.................#...............#.................#.......#...........#.......#.................#.....#...#.............#..E#
#.###########.#.#########.#.#####.#.#######.#####.#############.###.#####.#.#########.#.#.###.#.#####.###########.###.#.#.#.#####.#######.#.#
#.........#.#...#...#...#.#.....#.#...............#...........#.#.......#...........#...#...#.#.#...#.#.........#.#.#.#.#.................#.#
#########.#.#######.#.#.###.###.#.#.#.#.#.###.#########.#.#####.#.#########.#######.#######.#.#.###.#.#.#######.#.#.#.###.#.#.#.#.#.#######.#
#.....#.#.#.........#.#.........#.#...#.#.#.#.#.........#.#...#.#.#.#.........#...#.#...#...#.#.....#.....#.....#...................#.#...#.#
###.#.#.#.#.#######.#.#####.#####.#####.#.#.#.###.#########.#.#.#.#.#.#####.#.#.#.#.#.#.#.###.#####.#######.#.#####.###.#.#.#.#.###.#.#.#.#.#
#...#...#...#.........................#.#...#.....#...#.....#.#.#.#.#.#.....#.#.#.#...#.#.#.#.#...#.#...#...#.#.......#.#.....#.......#.#...#
#.###.#####.#.###.#####.#####.#########.#########.#.#.#.#####.#.#.#.#.#.#.#.#.#.#.#######.#.#.#.#.#.###.#.#####.#######.#######.#######.#####
#.#...#.........#...#.........................#...#.#...#.......#.#.#.#.#.....#.#.....#...#.#.#.#...#...#.....#...#.....#.....#.....#...#...#
#.#####.#######.###.#.###.#####.#####.#.#.###.#.###.###.#####.###.#.#.#####.###.#####.#.###.#.#.#####.#######.###.#.#####.###.#####.#.###.#.#
#.#.......#.....#...#.....#...#...#.................#...#...#.#...#.#.....#.#...#.....#.#...#.#.....#.....#.....#.#.......#.#.#...#.........#
#.#.#######.#####.#########.#.###.###.#.#.#.#.#.#.#######.#.#.#.###.#####.#.###.#.#####.###.#.#####.###.#.#.###.#.#.#######.#.###.#.#.#.###.#
#.....#.....#...#.........#.#...#...#.....#.#...#.....#...#.#.#.......#...#.....#...#.....#.#...#.#.....#.#...#.#.#.........#...#...#...#...#
#.#.#.#.#.###.#.#########.#.#.#.###.#####.#.#########.#.###.#########.#.###.#######.#####.#.###.#.#######.###.###.#.#.#####.###.#########.#.#
#.#...#.#.#...#.....#.....#.#.#...#.....#.....#...#...#...#.........#...#.........#.......#...#.#...#.....#.#.....#.......#...#...#...#...#.#
#.###.#.###.#####.###.#####.#.#########.#.###.#.###.###.#####.#.#.###.#.###.###.###########.#.#.###.#.#####.###.#.#.#####.#.#####.#.#.#.###.#
#.#...#.........#.#...#.....#.....#.....#...#.#...#.#...#.....#...#...#.......#.......#.....#.#.#...#.#.......#...#.#...#.#.....#...#.#...#.#
#.#.#############.#.#######.#####.#.#####.#.#.#.#.#.#.###.###.#####.#########.###.###.#.###.###.#.#.#.#####.#######.#.#.#######.#####.#.#.#.#
#...#.....................#.....#.#.......#.#.#.#.#...#...#.#.#...#.#.......#...#.#.#.....#...#...#.#.....#.....#...#.#.........#...#.#.#.#.#
#.#.#.#########.#####.###.#######.###.#####.#.#.#.#####.###.#.#.#.#.#.#.#######.#.#.#####.###.#.#########.###.#.#.###.#######.#.#.###.###.###
#.#.#.#.......#.........#.................#...#.#...#.#.#.#.....#...#.#...#.....#...#.......#...#...#...#...#.#...#...#.......#.#...#...#...#
#.#.#.#######.#########.#####.###############.#.#.#.#.#.#.#.###.#####.###.#.###.###.###.#.#######.#.#.#.###.#.#####.###.#.#####.###.#.#.#.#.#
#.....................#.#.....#...#.........#.#.#.#.#.#.....#...#...#.#...#.#.....#...#.#.....#...#...#.....#.#...#.#.#.#.....#...#...#.#.#.#
###.#.#.###.#.#.#####.#.#.###.#.#.#.#######.#.###.#.#.#.#.###.###.#.###.#.#.#.#######.#.###.#.#.###############.#.#.#.#.#####.###.#.#.#.###.#
#...#.#.#.......#.....#.....#...#...#.....#.#.....#...#.#.#.#.#...#...#.#.#.#.........#.#...#.#...#.............#...#.......#.......#.#...#.#
#.#.#.#.#.#.#####.###.#####.#########.#.###.#####.#####.#.#.#.#.#.###.#.###.#####.###.###.###.###.#.###.#.#.#########.###############.###.#.#
#...#...#.#.....#.#.....#.............#.#...#.....#.....#.#.#.#.#...#.#...#.....#...#.....#.#.#.#...#...#.#.......#.#...#.......#...#.#.#.#.#
###.#.###.#####.#.#####.#.#####.#.#######.###.#####.#####.#.#.#####.#.#.#.#####.#.#.#######.#.#.#####.###.#######.#.###.#.#####.#.#.#.#.#.#.#
#.#.....#.#...#.#.....#.#.#.....#.#.......#...#...#.#...#...#.......#.#.#.....#...#.....#.....#...#.#...#.#.....#.#.#...#...#.#.#.#.....#.#.#
#.#.#.#.#.#.#.#.#####.#.#.#.#####.#.###########.#.#.###.###.#########.#####.#.#########.#.#####.#.#.###.#.###.###.#.#.###.#.#.#.#######.#.#.#
#.......#.#.#.#.....#.#.#.#.....#.#.....#.......#...#...#...#.......#.#...#.#.....#.....#.#.....#...#...#.#...#...#...#.....#.........#.#.#.#
#.#.#.###.#.#.#.###.#.###.#####.#.#####.#.#########.#.#.#.###.#######.#.#.#.#.#####.#####.#.#######.#.###.#.#.#.###.###.#############.#.#.#.#
#...#.....#.#.....#.#...#...#.#.#.#...#...#...........#.#...#.......#...#...#.#.....#...#...#.......#...#...#.#...#...#.#.............#.#.#.#
###.#.#.#.#.#####.#.###.###.#.#.###.#.#####.#######.#######.#.#.###.###.#######.###.#.#.#####.#########.#######.#.###.#.#.###.###.#######.#.#
#.............#.#.#...#.......#.....#.....#.....#...#.....#.#.#...#.....#.....#.#.....#.#...............#.....#.#.#...#.....#...#...#.....#.#
#.#.#.#.#####.#.#.###.#################.#######.#.###.###.#.#.###.#######.###.#.#.#####.#########.#####.#.###.###.#.###########.###.#.#####.#
#.#...#.#...#...#...#.#...............#.....#...#...#...#.....#...#.......#...#.......#.#.........#.........#...#.#...#.......#...#.#...#...#
#.#.#.#.#.#.###.#.###.#.#######.#####.#.#.###.#####.#.#.#######.###.###.#.#.###########.#.#########.#####.#.###.#.#####.#####.#.#.#.###.#.###
#.#.#.....#...#.#...#...#...........#.#.#.........#.....#.....#.#...#...#.#.#.....#.....#...#...#...#...#.#.#.#...#...#.#.....#.#.#.#...#...#
#.#.#.#####.#.#.###.#########.#####.#.###########.#######.###.#.###.#.###.#.#.###.#.#######.#.#.#.###.#.###.#.###.#.#.#.#.#######.#.#.#####.#
#.#.#.#...#.#...#...........#.....#.#.......#...#.......#...#.#.....#.#...#...#...#.......#...#.#...#.#.#...#.....#.#...#.......#.#...#.....#
#.#.#.#.#.#######.#########.#######.#######.#.#.#.#.#######.#.#.###.#.#.#.#####.###.#####.#####.#.###.#.#.#.#.#####.###########.#.###.#.#.#.#
#.#.#.#.#.......#.......#...#.............#.#.#.#...#.....#.#.......#.#.#.....#...#.....#.....#.#.#...#.#...#.#...#...........#...#.....#.#.#
#.#.###.#######.#.#####.#.###.###.#######.#.#.#.#.###.#.#.#.#########.#.#####.###.#########.#.#.###.###.#.#.#.#.#.###########.###########.###
#.#...#.#.#.....#.......#.#...#.#.#.....#.#.#.#...#...#.#.#.....#...#.#.....#...#...#.......#.#.....#...#.#.#...#.......#.....#.........#...#
#.###.#.#.#.#####.#.#####.###.#.#.#.#.#.#.#.#.#####.###.#######.###.#.#####.#.#.#.#.#.#########.#######.###.#######.###.#.#####.#######.###.#
#.................#.#.....#...#.#...#.#.#.#.#.#...#.#.#.....#...#...#.....#.#.#.................#.....#.....#.........#.#.#...#.#...#.......#
#.#.#.#.#.###.#####.#.#####.###.#####.#.#.#.###.#.#.#.###.###.###.#######.#.###.#####.###########.###.#######.#######.###.#.#.#.#.#.#.###.###
#.#...#.#...#...#...#.#...#...#.........#.#...#.#.#...#...#...#...#...#...#...#.#...#.........#...#.#...#...#.....#.#.#...#.#...#.#.#...#...#
#.#####.###.###.#.###.#.#.#.#.#.#########.###.#.#.###.#.#.#.###.#.#.#.#.###.#.#.#.#.#####.#####.###.###.#.#.#####.#.#.#.###.###.#.#.#.###.#.#
#.#.....#.....#.#.....#.#.#.#.#.....#.......#...#.#...#.#.....#.#.#.#...#.#.#...#.#.#...#.#...#...#.....#.#.......#.#.#.#...#...#.#.#.#...#.#
#.#####.#####.#.#.###.#.#.###.#####.###.#.#####.#.#.###.#.###.#.#.#.#####.#.#####.#.###.#.#.#.###.#.#####.#.#######.#.#.###.###.#.#.###.#.#.#
#.....#...#...#.#...#...#...#.#...#.....#.#...#.#.....#...........#.......#.......#.......#.#.......#.....#.......#...#...#...#.#.#.......#.#
#####.###.#.###.###.#####.#.#.###.#######.#.#.#################.#######.#.###########.#.###.#######.#.#####.###.###.#####.###.#.#.#######.#.#
#...#.....#...#.#...#.....#...#...#.....#...#.#.....#.........#.#.......#.........#...#.#...#.....#.#.....#...#.#...#...#...#.#.#.#.#.......#
#.###########.###.###.###.#####.###.#.###.#.#.#.###.#.#####.#.#.#.###.###.###.###.#.#.###.###.###.#.#.###.###.#.#.###.#.###.#.###.#.#.###.#.#
#.......#.....#...#.....#.....#.....#...#.#.#...#...#...#...#.....#.........#.#.....#...#...#...#.#.#.#...#.#.#.......#.....................#
#.#.#####.#####.###.#####.#####.#######.#.#.#####.#####.#.#.#########.#####.#.#####.###.###.###.#.#.#.#.###.#.#########.#######.#.#.#.#.#.###
#.#.#.....#...#...#...#...#.....#.....#...#.#...#.#.....#.#.........#.#...#.#.#...#...#...#.#...#.#.#.#.#.....#.......#.#.....#.....#.#.#...#
#.#.#.#####.#.#.#.###.#.###.#######.#.#####.###.#.###.#######.#####.###.#.###.#.#.###.###.#.#.#####.#.#.###.###.#####.###.#.#.#.#####.#.#.#.#
#.#...#.....#...#.#...#...#.#.......#.....#.#...#.....#.....#...#.......#.....#.#...#...#...#.....#.#.#...#...#.#...#.......#.#.#.....#.#...#
#.#######.#####.#.###.###.#.#.#.#########.#.#.#########.###.###.###############.###.###.#####.###.#.#.###.#####.#.#.#########.#.#.#####.#.###
#.......#.#...#.#...#...#...#.#.#.....#...#.#...#.......#...#...#.....#.........#.#...#.#.......#.#.#...#...........#...#.....#.#.....#...#.#
#######.#.#.#.#####.###.#######.###.###.###.###.#.#####.###.#.###.###.#.#########.###.#.#########.#.#.#############.###.#.#####.#####.#.###.#
#.#.....#.#.#.......#.#...#.....#...#...#.#.#...#.....#...#...#...#...#.#...#.......#.#.#.......#.#.#.#.....#...#.......#.#...........#.....#
#.#.#######.#####.###.###.#.#####.#.#.###.#.#.###.#.#.###.###.#.###.###.#.###.###.#.#.#.#.#####.#.#.###.###.#.#.#########.#.#####.###.#####.#
#...#.......#.....#.........#.....#.......#.#.......#...#...#.#.#.#.#...#.......#.#.#.#...#.......#.....#.#...#.#...#...#.#...#.#...#.#...#.#
#.###.###.#####.#.#.#######.#.#.###.#.###.#.#########.#.#.#.###.#.#.#.###########.#.#.###############.###.#####.#.#.#.#.#.###.#.###.###.#.###
#.#.....#.......#.#.#.........#.#...#...#.#...........#.#.#.......#...............#.#.#...#...#.......#...........#...#.#.#...#...#.....#...#
#.#.###.#.#######.#.#####.#####.#.#####.#.#######.#####.#.#######.#################.#.#.#.#.#.#.#.###.#.###.#.#########.#.#.#.###.#########.#
#.....#.#.....#.#.#.....#.#.....#.#.....#.......#.#.....#...#...#.#...#...#.#.......#.#.#...#...#.#...#.#...#.........#...#.#...#.....#.....#
###.#.#.#.#.#.#.#.#.#.#.#.#.#####.#.#.#########.#.#.#########.#.###.#.###.#.#.#######.#.#########.#.#####.###########.#####.###.#####.#.###.#
#...#.#...#.#.#...#...#...#...#.#.#.#.........#...#...........#...#.#.....#.#.#.....#.#...#.......#.......#.......#...#...#...#.#.....#.#...#
###.#.###.#.#.###.###########.#.#.#.#########.###.###############.#.#####.#.#.#.###.#.###.###.#.#.#########.#####.#.###.#.#.#.#.#.#####.#####
#...#.#...#.#...#.#...........#.#.#.........#.#...#...#...........#.#.....#...#...#.#.......#...#.#.........#.......#...#...#.....#...#.....#
#.#.#.#.###.###.#.#.###########.#.#.#######.#.#.###.#.#.#######.#.#.###.#.#.#.###.#.#######.#.#.#.#######.#.#.#######.#######.#####.#.#.###.#
#...#.#.#...#...#.#...#.....#...#...#.....#.#.#.....#.#.....#.#.#...#...#.#.#...#.#.....#.#...#.#.......#.#.#.....#...#...#.........#.......#
#.#.#.#.#.###.###.###.#.###.###.###.#.###.###.#######.#.#.#.#.#.#####.#####.#.#.#.#.###.#.###.#####.###.#.#.#####.#.#####.#.#######.#.###.###
#.#...#.#...#.#...#...#...#...#...#...#.#...#.#.........#.#.#.......#.......#.#.#.#...#.#.....#...#...#.#.#.......#.......#.....#...#...#...#
#.#.###.#####.#.###.###.#####.#.#######.###.#.#.#.#.###.#.#.#######.###.#######.#.###.#.#######.#.#.#.#.#.#.#############.#####.#.#####.###.#
#.......#.....#...#.....#.....#...#...#.....#...#.#.#...#.#...#...#...#.#.....#.#...#...........#...#.#.#...#...........#...#.#.#.......#...#
#########.#######.#######.#####.#.#.#.#.#########.#.#.###.###.#.#####.#.###.#.#.###.###############.#.#.#####.###.#.#######.#.#.#.#####.#.###
#.........#.....#.........#...#.#.#.#.............#.#.....#...#.....#.#.....#...#.#.....#...#.........#.#...#.#.#.#.#.........#.#.....#.....#
#######.#######.#######.###.#.###.#.###############.#######.###.#.###.#########.#.#####.#.#.#.#######.#.#.#.#.#.#.###.#.#####.#.#####.#.###.#
#.......#.....#.............#.....#.#.....#.......#.....#...#.#.#.....#...........#...#.#.#...#.....#.#...#.#.#.#.....#.....#.#.....#...#...#
#.#######.###.#######.#####.#.#####.#.###.#.#####.#####.#.###.#.###########.###.###.#.#.#.#####.###.###.#.#.#.#.#########.#.#.#####.###.#.#.#
#.#.....#...#.......#...#...#.#.....#...#...#.........#.#.#...........#...#.....#...#.#.#.#...#.#.#...#.#...#.......#.....#.#.....#.#.#...#.#
#.#.###.###.#######.#.###.###.#.#.#####.#####.#.#####.#.#.#.#.#.#.###.#.#.#######.###.#.#.#.#.#.#.###.###.#######.###.#####.###.###.#.#.###.#
#.#...#.....#...#.#.#.#...#...#.#.....#.#.#...#.#...#.#.#.#.#.#.#.#.....#.......#.#.#.#.#...#...#...#.#...#.....#.#...#...#.#...#...#.....#.#
#.#.#.#######.#.#.#.###.#.#####.#.#####.#.#.#####.#.###.#.###.#.#.#############.#.#.#.#.###########.#.#.###.#.###.#.#.#.#.###.###.###.#.#.#.#
#.#.#.#...#...#...#.....#.#...#...#.....#.#.......#...#.#.#...#.#.#...#...#.....#.#.#.#.#...#.......#.#.....#.#...#.....#.......#.#...#...#.#
#.###.#.#.###.#####.#.#####.#.###.#.#####.###########.#.#.#.#.#.#.#.#.#.#.#####.#.#.#.#.###.#.###.#.#.#######.#.#################.#####.###.#
#...#.#.#.....#.....#.#.....#...#.#.....#...........#...#.#.#.#.#.#.#...#.....#.#.#.....#...#...#...#.#...#...#.........#...#.....#...#...#.#
###.#.#.#######.###.#.#.#####.###.#####.#####.###.#.#####.#.###.#.#.#########.#.#.#######.#####.#.###.#.#.#.#.#########.###.#.#####.#.#.#.#.#
#...............#.#...#.#.........#.........#.#...#...#...#.#...#.#...#...#...#.#.....#.......#.#.......#...#.....#...#.....#...#...#...#...#
#.###.#.#####.#.#.#.###.#.#.#########.#####.#.#.#####.#.#.#.#.###.###.#.###.###.#.###.###.#.###.#################.#.#.#####.#.#.#.#####.#.#.#
#.#...#.#...#...#...#.#...#.....#.........#.#.#...#...#.#.#.#.......#...#...#.#.#...#...#.#...#.#...........#...#.#.#.....#...#.#.....#.#.#.#
#.###.###.#.#.###.#.#.#########.#.#####.###.#.###.#####.#.#.#.###.#####.#.###.#.#######.#.###.#.#.#########.###.#.#####.#####.#.#.###.#.#.#.#
#.......#.#.#.#...#.....#...#.#.#.....#.#...#.#.#.......#.......#.#.....#.#.#...#.......#...#.#.#...#.....#...#.........#...#.#.#.#...#...#.#
#.#.#.#.#.#.#.###.#####.#.#.#.#.#####.###.###.#.#########.#.#.###.#.#####.#.#.###.#########.#.#.###.#.#.###.#.#########.#.#.#.#.###.#######.#
#.#.#.#.#.#.#.....#.......#...#.......#...#...#...#.......#.#.....#.#.....#.#.#...#.#.......#...#...#.#.#...#.......#...#.#...#...#.........#
#.#.#.#.#.#.#####.#.#####.#.#####.#####.###.###.#.#.#.#.###.#######.#.#####.#.###.#.#.###########.###.###.#.#######.#####.#######.#########.#
#.....#.........#.#.#...#...#...#.#.....#.#...#.#.#.#...#...#...#...#.#.......#...#.#.#.....#.........#...#.......#.........#...............#
#.#.###########.#.#.#.#.#####.#.#.#.#####.###.###.#.#####.#####.#.###.#.#####.#.###.#.#.###.#.#######.#.#########.#########.#.#.###.#####.###
#.#.......#.....#...........#.....#.#.....#.#.....#...#.#.....#.#...#.#.#...#...#.........#...#.#...#.#...#...#...#.........#.#...#.#...#...#
#.#######.#.###.#####.#####.#.#####.###.#.#.#####.###.#.#####.#.###.#.###.#.#############.#####.#.#.#####.#.#.#.###.#####.#.#.###.#.#.#.###.#
#.......#.#.#...#.........#...#.....#...#...#.....#...#...#...#.#...#.....#.....................#.#.#...#.#.#...#...#.........#...#...#...#.#
#####.###.#.#####.#############.#####.#######.#####.###.#.#.###.#.#########################.#####.#.#.#.#.#.#######.#.###########.#.#####.#.#
#...#.#...#...#...#...#.........#...........#...#...#.....................#...#.........#...#.....#...#...#.#.#.....#.......#...............#
#.###.#.#####.#.###.#.#.#########.#########.#.###.###########.###.#########.#.#.###.###.#####.###########.#.#.#.#.#######.###.#.#.#.#.#.###.#
#.....#.#...#...#.....#.#.....#...#.......#.#.#...#.......#...#...#.........#...#.............#.....#.....#.#...#.......#.#...............#.#
#.#.###.#.#.#.#######.#.#####.#.#####.###.#.#.#.###.#####.#.###.###.#############.###.#########.###.#.###.#.###########.###.###.#.###.###.#.#
#.#...#.#.#.#.......#.#.#.....#.....#.#...#...#...#.....#.#...#.#.#...#...#.........#...#.....#...#.......#.#...#.......#...#...............#
###.#.#.#.#.#######.#.#.#.#########.#.#.###.#####.#.#####.#####.#.###.#.###.#########.#.#.###.###.#####.#.#.#.#.#.#######.###.###.#####.#.#.#
#...#...#.#.#.....#...#.#.......#...#.#.#.......#.#.#.....#.......#...#.#...#...#...#.#.#...#.#...#.#...#.#.....#.#.......#.................#
#.#.#####.#.#.###.###.#.#.###.###.#.###.#.#####.#.#.#.###.#.#######.###.#.###.#.#.#.###.#.###.#.###.#.#########.#.#.#######.###.#.#####.#.#.#
#.......#.#.#...#...#.#.#...#...#.#.....#.#.....#...#.#...#.#...#...#...#.#...#.#.#.......#...#.....#.#.......#.#.....#.....#...#.....#...#.#
#.#.###.#.#.###.#.###.#.#####.#.#.#.#####.#.#####.###.#.###.###.#.###.###.###.###.###.#.#.#.#######.#.#.#.###.#.#.#####.#####.###.###.#####.#
#.#...........#.#.#...#.....#.#.#.#.#.....#...#.#...#.#.....#...#.#...........#...#...#...#.....#...#...#.....#.#...#...#...#.#...#...#.....#
#.#.#.#####.#.#.#.#.###.###.#.#.#.#.#.#.#.###.#.#.###.#.#####.#.#.#######.#####.###.#####.###.#.#.#######.#####.###.#.###.###.#.#.#.#######.#
#.#.#.#.....#...#.#.#.....#.#.#.#.#.#.#...#.#.#...#...#.....#.#.#.......#.#.....#...........#...#.#.#...#.....#...#.#.#.#.....#.#.#.#.......#
#.###.#.###.#####.#.#.#.#.#.#.#.#.#.#.#####.#.#.###.#######.#.#.#######.###.#####.###.#######.###.#.#.#.#####.#.#.###.#.#.#####.#.#.#.#####.#
#.#...#.#...#...#...#...#.#.#.#.....#.#.....#.#...#.#.....#...#...#...#...#.#...#...#...#...#...#.#.#.#.#.....#.#.#...#.#.#.....#.#.#.#...#.#
#.#.###.#.###.#.#.###.#.###.#.#######.#.###.#.###.#.#.###.#.###.###.#.#.#.#.###.###.#.###.#.#.#.#.#.#.#.#.###.#.#.#.###.#.###.###.#.#.#.#.#.#
#.#...#.#...#.#.#...#.#...#.#.....#...#...#...#...#.#...#.#.....#...#.#...........#.#.#...#...#.#...#.#...#.#.#.#.......#.....#...#.#.#.#.#.#
#.###.#.###.#.#.#####.###.#.#.###.#.#####.#########.###.#.#.#####.###.#######.#.###.#.#.#####.#.#.###.#####.#.#.#######.#######.#.#.#.#.#.#.#
#...#.#...#.#.#.......#.#.#...#.#.#...#.#.#.......#.....#...#.#...#...#.....#...#...#.#.#...#.#...#...#...#.....#.......#.......#.#...#.#.#.#
###.#.###.###.#########.#.#.#.#.#.#.#.#.#.#.#.###.#######.#.#.#.###.###.###.#.#.#.#####.#.###.#####.#####.#.#####.###.#.###.#####.#####.#.#.#
#.#.#...#...#.#.....#...#.......#.#.#.#...#.#.#.....#...#...#.#.#.................................#.....#...#.....#.#.#...#.....#.......#.#.#
#.#.#.#.###.#.#.###.#.#.###.#.#.#.#.#.###.#.#.#####.#.#.###.#.#.#.#######.#.#.#.###########.#####.#.###.#.###.#####.#.###.#.###.#.###.###.#.#
#...................#.#.......#...#.#...#.#.#.....#...#.#.....#.#.......#.#.#...#.#.........................#.#...........................#.#
#.###.#.###########.#.#####.#.###.#.###.#.#.#####.#####.###.#.#.###.###.#.#.#.#.#.#.###.#.#.#.#.###.#.#####.#.#.###.#.#.#.#.#.#####.#.#####.#
#...#.#...........#...#.....#.....#.#...#...#...#...................#...#.#...#.#...#...#...#.#...#.#.....#.#.#...#.#.#.....#.......#.......#
###.#####.#.#####.#####.###.#.###.###.###.#.#.#.#.#######.#.#########.###.###.#.###.#.###.#######.#######.#.#.#####.#.#####.#####.###.###.#.#
#.......................#...#...#.....#.#.....#.#.......#...#.......#.#.....#.#.....#.#...#.......#.....#.#...#...#.#.........#...#...#.#...#
#.#.#.#.#.#.#.#.#########.#.###.#######.#.###########.#.###.#.#####.#.#.#.###.#.###.#.#.###.#######.###.#.###.#.#.#.#######.#.#####.#.#.#####
#.#.#.#.#.#.#.#...#...#...#...#...#.....#.#.........#.#...#.#.#...#.#.#.#.....#...........................#...#.#.....#.........#...#...#...#
#.#.#.#.###.#.#####.#.#.#.#.#.###.#.###.#.#.###.###.#####.#.#.#.#.#.#.#.#####.#.###.#######.#.#.###########.#.#.#####.###.#.###.#.###.#.#.#.#
#S....#.....#.......#.......#.....#...#.....#.............#...#.#.....#.....................#.#.................#.........#...#.......#...#.#
#############################################################################################################################################""";
}
