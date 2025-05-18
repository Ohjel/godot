import 'maze.dart';

int vertexIndex(int x, int y, int width, int height) {
  assert(0 <= x && x < width);
  assert(0 <= y && y < height);
  return y * width + x;
}

Iterable<int> neighborIndexes(
    List<MazeVertex> vertices, int index, int width, int height) {
  assert(vertices.isNotEmpty);
  assert(0 <= index && index < vertices.length);
  final v = vertices[index];
  return [
    (v.y > 0, (v.x, v.y - 1)),
    (v.x > 0, (v.x - 1, v.y)),
    (v.x < width - 1, (v.x + 1, v.y)),
    (v.y < height - 1, (v.x, v.y + 1)),
  ].where((r) => r.$1).map((r) => vertexIndex(r.$2.$1, r.$2.$2, width, height));
}

Iterable<int> accessibleNeighborIndexes(Maze maze, int index) {
  final neighbors =
      neighborIndexes(maze.vertices, index, maze.width, maze.height);
  return neighbors.where((n) => maze.edges.contains(edgeFrom(index, n)));
}

MazeEdge edgeFrom(int a, int b) {
  return switch (a < b) {
    true => MazeEdge(a: a, b: b),
    false => MazeEdge(a: b, b: a),
  };
}

void addEdge(List<MazeVertex> vertices, List<MazeEdge> edges, int a, int b) {
  assert(0 <= a && a < vertices.length);
  assert(0 <= b && b < vertices.length);
  assert(a != b);
  edges.add(edgeFrom(a, b));
}

String formatMazeToString(Maze m, [List<MazeVertex>? path]) {
  int verIdx(int x, int y) => vertexIndex(x, y, m.width, m.height);

  final buffer = StringBuffer();

  for (int y = 0; y < m.height; y++) {
    // Draw horizontal walls
    for (int x = 0; x < m.width; x++) {
      buffer.write('+');
      if (y == 0 || !m.edges.contains((a: verIdx(x, y - 1), b: verIdx(x, y)))) {
        buffer.write('---');
      } else {
        buffer.write('   ');
      }
    }
    buffer.writeln('+');

    // Draw vertical walls
    for (int x = 0; x < m.width; x++) {
      if (x == 0 || !m.edges.contains((a: verIdx(x - 1, y), b: verIdx(x, y)))) {
        buffer.write('|');
      } else {
        buffer.write(' ');
      }

      // Draw path or empty cell
      if (path != null && path.contains((x: x, y: y))) {
        buffer.write(' * ');
      } else {
        buffer.write('   ');
      }
    }
    buffer.writeln('|');
  }

  // Add bottom line
  for (int x = 0; x < m.width; x++) {
    buffer.write('+');
    buffer.write('---');
  }
  buffer.writeln('+');

  return buffer.toString();
}
