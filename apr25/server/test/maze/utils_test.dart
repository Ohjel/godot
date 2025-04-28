import 'package:server/maze/utils.dart';
import 'package:test/test.dart';

import 'const_mazes.dart';

void main() {
  test('vertexIndex', () {
    expect(vertexIndex(0, 0, 4, 4), 0);
    expect(vertexIndex(3, 0, 4, 4), 3);
    expect(vertexIndex(5, 2, 9, 4), 9 * 2 + 5);
    expectLater(() => vertexIndex(0, 0, 0, 0), throwsA(isA<AssertionError>()));
    expect(vertexIndex(2, 2, 3, 3), 2 * 3 + 2);
  });

  test('neighborIndex', () {
    expect(neighborIndexes([(x: 0, y: 0)], 0, 1, 1), []);
    final sm = smallMaze.maze;
    expect(neighborIndexes(sm.vertices, 0, sm.width, sm.height), [1, 2]);
    expect(neighborIndexes(sm.vertices, 4, sm.width, sm.height), [2, 5]);
    expect(neighborIndexes(sm.vertices, 5, sm.width, sm.height), [3, 4]);
    final mm = mediumMaze.maze;
    expect(neighborIndexes(mm.vertices, 0, mm.width, mm.height), [1, 8]);
    expect(neighborIndexes(mm.vertices, 23, mm.width, mm.height), [15, 22, 31]);
    expect(neighborIndexes(mm.vertices, 67, mm.width, mm.height), [59, 66, 68, 75]);
  });

  test('addEdge', () {}, skip: 'TODO: To implement');

  test('formatMazeToString', () {
    expect(formatMazeToString(smallMaze.maze), smallMaze.string);
    expect(formatMazeToString(mediumMaze.maze), mediumMaze.string);
  });
}
