import 'dart:math' show Random;

import 'maze.dart';
import 'utils.dart';

Maze loopErasedRandomWalks(
    {required int width,
    required int height,
    int vertexSize = 1,
    Random? random}) {
  assert(width > 0 && height > 0);
  assert(vertexSize > 0);
  random ??= Random();
  final vertices = List<MazeVertex>.generate(
      width * height, (i) => (x: i % width, y: i ~/ width));
  final edges = <MazeEdge>[];

  final frontier = List.generate(width * height, (i) => i)..shuffle(random);
  final visited = {frontier.first};

  for (final current in frontier) {
    if (visited.contains(current)) continue;

    // Perform a random walk with loop erasure
    final walkPath = <int>[];
    var nextStep = current;
    while (!visited.contains(nextStep)) {
      if (walkPath.contains(nextStep)) {
        walkPath.removeRange(walkPath.lastIndexOf(nextStep), walkPath.length);
      }

      walkPath.add(nextStep);

      final neighbors =
          neighborIndexes(vertices, nextStep, width, height).toList();
      nextStep = neighbors[random.nextInt(neighbors.length)];
    }
    walkPath.add(nextStep);

    // Add the generated walk as edges to the maze
    assert(walkPath.isNotEmpty);
    assert(current == walkPath.first);
    visited.add(current);
    for (int i = 0; i < walkPath.length - 1; i++) {
      addEdge(vertices, edges, walkPath[i], walkPath[i + 1]);
      visited.add(walkPath[i + 1]);
    }
  }

  return Maze(
      vertices: vertices,
      edges: edges,
      vertexSize: vertexSize,
      width: width,
      height: height);
}
