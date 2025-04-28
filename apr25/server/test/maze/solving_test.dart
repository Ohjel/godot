import 'package:server/solving.dart';
import 'package:test/test.dart';

import 'const_mazes.dart';

void main() {
  test('Small maze', () {
    expect(solveMaze(smallMaze.maze, 0, 5),
        [(x: 0, y: 0), (x: 0, y: 1), (x: 0, y: 2), (x: 1, y: 2)]);
    expect(solveMaze(smallMaze.maze, 3, 5), [
      (x: 1, y: 1),
      (x: 1, y: 0),
      (x: 0, y: 0),
      (x: 0, y: 1),
      (x: 0, y: 2),
      (x: 1, y: 2)
    ]);
    expect(solveMaze(smallMaze.maze, 2, 1),
        [(x: 0, y: 1), (x: 0, y: 0), (x: 1, y: 0)]);
  });

  test('Medium maze', () {
    expect(solveMaze(mediumMaze.maze, 0, 10), [
      (x: 0, y: 0),
      (x: 0, y: 1),
      (x: 0, y: 2),
      (x: 1, y: 2),
      (x: 2, y: 2),
      (x: 2, y: 1)
    ]);
    expect(solveMaze(mediumMaze.maze, 0, 79), [
      (x: 0, y: 0),
      (x: 0, y: 1),
      (x: 0, y: 2),
      (x: 1, y: 2),
      (x: 2, y: 2),
      (x: 3, y: 2),
      (x: 3, y: 1),
      (x: 4, y: 1),
      (x: 4, y: 2),
      (x: 5, y: 2),
      (x: 5, y: 1),
      (x: 5, y: 0),
      (x: 6, y: 0),
      (x: 6, y: 1),
      (x: 6, y: 2),
      (x: 6, y: 3),
      (x: 7, y: 3),
      (x: 7, y: 4),
      (x: 7, y: 5),
      (x: 7, y: 6),
      (x: 6, y: 6),
      (x: 6, y: 5),
      (x: 5, y: 5),
      (x: 5, y: 6),
      (x: 4, y: 6),
      (x: 4, y: 7),
      (x: 5, y: 7),
      (x: 5, y: 8),
      (x: 5, y: 9),
      (x: 6, y: 9),
      (x: 7, y: 9)
    ]);
  });
}
