import 'package:collection/collection.dart';
import 'package:server/maze/utils.dart';

import 'maze/maze.dart';

List<MazeVertex> solveMaze(Maze maze, int startIndex, int endIndex) {
  assert(startIndex >= 0 && startIndex < maze.vertices.length);
  assert(endIndex >= 0 && endIndex < maze.vertices.length);

  final parentOf = <int, int?>{startIndex: null};
  final visited = <int>{startIndex};
  final frontier = PriorityQueue<(int, int)>((a, b) {
    if (a.$1 != b.$1) return a.$1.compareTo(b.$1);
    return a.$2.compareTo(b.$2);
  })
    ..add((0, startIndex));

  while (frontier.isNotEmpty) {
    final (currentCost, currentIndex) = frontier.removeFirst();
    if (currentIndex == endIndex) {
      return _reconstructPath(maze.vertices, parentOf, currentIndex);
    }
    visited.add(currentIndex);

    for (final neighborIndex in accessibleNeighborIndexes(maze, currentIndex)) {
      if (!visited.contains(neighborIndex)) {
        parentOf[neighborIndex] ??= currentIndex;
        frontier.add((
          currentCost +
              _estimatedCostLeft(maze.vertices, currentIndex, endIndex),
          neighborIndex
        ));
      }
    }
  }

  throw AssertionError(
      'No path could be found between start $startIndex and end $endIndex');
}

List<MazeVertex> _reconstructPath(
    List<MazeVertex> vertices, Map<int, int?> parentOf, int? lastIndex) {
  assert(lastIndex != null);

  final path = <MazeVertex>[];
  while (lastIndex != null) {
    assert(0 <= lastIndex && lastIndex < vertices.length);
    path.add(vertices[lastIndex]);
    lastIndex = parentOf[lastIndex];
  }

  return path.reversed.toList();
}

int _estimatedCostLeft(
    List<MazeVertex> vertices, int currentIndex, int endIndex) {
  assert(currentIndex >= 0 && currentIndex < vertices.length);
  assert(endIndex >= 0 && endIndex < vertices.length);

  final current = vertices[currentIndex];
  final end = vertices[endIndex];
  return (end.x - current.x).abs() + (end.y - current.y).abs();
}
