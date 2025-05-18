import 'package:server/maze/maze.dart';

const smallMaze = (
  maze: Maze(
    width: 2,
    height: 3,
    edges: [
      MazeEdge(a: 1, b: 3),
      MazeEdge(a: 0, b: 1),
      MazeEdge(a: 0, b: 2),
      MazeEdge(a: 2, b: 4),
      MazeEdge(a: 4, b: 5)
    ],
    vertices: [
      MazeVertex(x: 0, y: 0),
      MazeVertex(x: 1, y: 0),
      MazeVertex(x: 0, y: 1),
      MazeVertex(x: 1, y: 1),
      MazeVertex(x: 0, y: 2),
      MazeVertex(x: 1, y: 2)
    ],
  ),
  string: '''
+---+---+
|       |
+   +   +
|   |   |
+   +---+
|       |
+---+---+
'''
);

const mediumMaze = (
  maze: Maze(
    width: 8,
    height: 10,
    edges: [
      MazeEdge(a: 62, b: 63),
      MazeEdge(a: 61, b: 62),
      MazeEdge(a: 60, b: 61),
      MazeEdge(a: 52, b: 60),
      MazeEdge(a: 52, b: 53),
      MazeEdge(a: 45, b: 53),
      MazeEdge(a: 45, b: 46),
      MazeEdge(a: 46, b: 54),
      MazeEdge(a: 54, b: 55),
      MazeEdge(a: 47, b: 55),
      MazeEdge(a: 39, b: 47),
      MazeEdge(a: 31, b: 39),
      MazeEdge(a: 30, b: 31),
      MazeEdge(a: 22, b: 30),
      MazeEdge(a: 14, b: 22),
      MazeEdge(a: 6, b: 14),
      MazeEdge(a: 5, b: 6),
      MazeEdge(a: 5, b: 13),
      MazeEdge(a: 13, b: 21),
      MazeEdge(a: 20, b: 21),
      MazeEdge(a: 4, b: 5),
      MazeEdge(a: 10, b: 18),
      MazeEdge(a: 18, b: 19),
      MazeEdge(a: 11, b: 19),
      MazeEdge(a: 11, b: 12),
      MazeEdge(a: 12, b: 20),
      MazeEdge(a: 40, b: 41),
      MazeEdge(a: 33, b: 41),
      MazeEdge(a: 32, b: 33),
      MazeEdge(a: 24, b: 32),
      MazeEdge(a: 24, b: 25),
      MazeEdge(a: 17, b: 25),
      MazeEdge(a: 17, b: 18),
      MazeEdge(a: 58, b: 66),
      MazeEdge(a: 65, b: 66),
      MazeEdge(a: 65, b: 73),
      MazeEdge(a: 72, b: 73),
      MazeEdge(a: 64, b: 72),
      MazeEdge(a: 56, b: 64),
      MazeEdge(a: 48, b: 56),
      MazeEdge(a: 48, b: 49),
      MazeEdge(a: 49, b: 50),
      MazeEdge(a: 50, b: 51),
      MazeEdge(a: 51, b: 59),
      MazeEdge(a: 59, b: 67),
      MazeEdge(a: 67, b: 68),
      MazeEdge(a: 68, b: 69),
      MazeEdge(a: 61, b: 69),
      MazeEdge(a: 75, b: 76),
      MazeEdge(a: 74, b: 75),
      MazeEdge(a: 66, b: 74),
      MazeEdge(a: 29, b: 37),
      MazeEdge(a: 37, b: 38),
      MazeEdge(a: 30, b: 38),
      MazeEdge(a: 8, b: 16),
      MazeEdge(a: 16, b: 17),
      MazeEdge(a: 36, b: 44),
      MazeEdge(a: 44, b: 45),
      MazeEdge(a: 27, b: 35),
      MazeEdge(a: 35, b: 43),
      MazeEdge(a: 43, b: 44),
      MazeEdge(a: 0, b: 1),
      MazeEdge(a: 0, b: 8),
      MazeEdge(a: 78, b: 79),
      MazeEdge(a: 77, b: 78),
      MazeEdge(a: 69, b: 77),
      MazeEdge(a: 20, b: 28),
      MazeEdge(a: 7, b: 15),
      MazeEdge(a: 6, b: 7),
      MazeEdge(a: 70, b: 78),
      MazeEdge(a: 70, b: 71),
      MazeEdge(a: 34, b: 35),
      MazeEdge(a: 9, b: 17),
      MazeEdge(a: 41, b: 42),
      MazeEdge(a: 2, b: 3),
      MazeEdge(a: 3, b: 4),
      MazeEdge(a: 57, b: 65),
      MazeEdge(a: 22, b: 23),
      MazeEdge(a: 25, b: 26)
    ],
    vertices: [
      MazeVertex(x: 0, y: 0),
      MazeVertex(x: 1, y: 0),
      MazeVertex(x: 2, y: 0),
      MazeVertex(x: 3, y: 0),
      MazeVertex(x: 4, y: 0),
      MazeVertex(x: 5, y: 0),
      MazeVertex(x: 6, y: 0),
      MazeVertex(x: 7, y: 0),
      MazeVertex(x: 0, y: 1),
      MazeVertex(x: 1, y: 1),
      MazeVertex(x: 2, y: 1),
      MazeVertex(x: 3, y: 1),
      MazeVertex(x: 4, y: 1),
      MazeVertex(x: 5, y: 1),
      MazeVertex(x: 6, y: 1),
      MazeVertex(x: 7, y: 1),
      MazeVertex(x: 0, y: 2),
      MazeVertex(x: 1, y: 2),
      MazeVertex(x: 2, y: 2),
      MazeVertex(x: 3, y: 2),
      MazeVertex(x: 4, y: 2),
      MazeVertex(x: 5, y: 2),
      MazeVertex(x: 6, y: 2),
      MazeVertex(x: 7, y: 2),
      MazeVertex(x: 0, y: 3),
      MazeVertex(x: 1, y: 3),
      MazeVertex(x: 2, y: 3),
      MazeVertex(x: 3, y: 3),
      MazeVertex(x: 4, y: 3),
      MazeVertex(x: 5, y: 3),
      MazeVertex(x: 6, y: 3),
      MazeVertex(x: 7, y: 3),
      MazeVertex(x: 0, y: 4),
      MazeVertex(x: 1, y: 4),
      MazeVertex(x: 2, y: 4),
      MazeVertex(x: 3, y: 4),
      MazeVertex(x: 4, y: 4),
      MazeVertex(x: 5, y: 4),
      MazeVertex(x: 6, y: 4),
      MazeVertex(x: 7, y: 4),
      MazeVertex(x: 0, y: 5),
      MazeVertex(x: 1, y: 5),
      MazeVertex(x: 2, y: 5),
      MazeVertex(x: 3, y: 5),
      MazeVertex(x: 4, y: 5),
      MazeVertex(x: 5, y: 5),
      MazeVertex(x: 6, y: 5),
      MazeVertex(x: 7, y: 5),
      MazeVertex(x: 0, y: 6),
      MazeVertex(x: 1, y: 6),
      MazeVertex(x: 2, y: 6),
      MazeVertex(x: 3, y: 6),
      MazeVertex(x: 4, y: 6),
      MazeVertex(x: 5, y: 6),
      MazeVertex(x: 6, y: 6),
      MazeVertex(x: 7, y: 6),
      MazeVertex(x: 0, y: 7),
      MazeVertex(x: 1, y: 7),
      MazeVertex(x: 2, y: 7),
      MazeVertex(x: 3, y: 7),
      MazeVertex(x: 4, y: 7),
      MazeVertex(x: 5, y: 7),
      MazeVertex(x: 6, y: 7),
      MazeVertex(x: 7, y: 7),
      MazeVertex(x: 0, y: 8),
      MazeVertex(x: 1, y: 8),
      MazeVertex(x: 2, y: 8),
      MazeVertex(x: 3, y: 8),
      MazeVertex(x: 4, y: 8),
      MazeVertex(x: 5, y: 8),
      MazeVertex(x: 6, y: 8),
      MazeVertex(x: 7, y: 8),
      MazeVertex(x: 0, y: 9),
      MazeVertex(x: 1, y: 9),
      MazeVertex(x: 2, y: 9),
      MazeVertex(x: 3, y: 9),
      MazeVertex(x: 4, y: 9),
      MazeVertex(x: 5, y: 9),
      MazeVertex(x: 6, y: 9),
      MazeVertex(x: 7, y: 9)
    ],
  ),
  string: '''
+---+---+---+---+---+---+---+---+
|       |                       |
+   +---+---+---+---+   +   +   +
|   |   |   |       |   |   |   |
+   +   +   +   +   +   +   +---+
|               |       |       |
+---+   +---+---+   +---+   +---+
|           |   |   |   |       |
+   +---+---+   +---+   +   +   +
|       |       |   |       |   |
+---+   +---+   +   +---+---+   +
|           |               |   |
+---+---+---+---+---+   +   +   +
|               |       |       |
+   +---+---+   +   +---+---+---+
|   |   |   |   |               |
+   +   +   +   +---+   +---+---+
|   |       |           |       |
+   +   +   +---+---+   +   +---+
|       |           |           |
+---+---+---+---+---+---+---+---+
'''
);
