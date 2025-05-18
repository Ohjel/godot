import 'package:json_annotation/json_annotation.dart';

part 'maze.g.dart';

extension type const MazeVertex._(({int x, int y}) vertex) {
  const MazeVertex({required int x, required int y}) : this._((x: x, y: y));

  int get x => vertex.x;
  int get y => vertex.y;

  List<int> toJson() => [vertex.x, vertex.y];
}

extension type const MazeEdge._(({int a, int b}) edge) {
  const MazeEdge({required int a, required int b}) : this._((a: a, b: b));

  int get a => edge.a;
  int get b => edge.b;

  List<int> toJson() {
    assert(edge.a < edge.b);
    return [edge.a, edge.b];
  }
}

@JsonSerializable(createFactory: false, explicitToJson: true)
class Maze {
  final int width;
  final int height;
  final List<MazeVertex> vertices;
  final List<MazeEdge> edges;

  const Maze(
      {required this.vertices,
      required this.edges,
      required this.width,
      required this.height});

  Map<String, dynamic> toJson() => _$MazeToJson(this);

  @JsonKey()
  List<List<List<int>>> get renderedCellCodes {
    return List.generate(height, (y) {
      return List.generate(width, (x) {
        final cellCode = _vertexCellCode(MazeVertex(x: x, y: y));
        return [cellCode.$1, cellCode.$2];
      });
    });
  }

  (int, int) _vertexCellCode(MazeVertex vertex) {
    // Retrieve vertex index and edges
    final vertexIndex = vertices.indexOf(vertex);
    if (vertexIndex < 0) return (-1, -1);
    final vertexEdges =
        edges.where((e) => e.a == vertexIndex || e.b == vertexIndex);
    assert(vertexEdges.length <= 4);

    // Get all directions available from this vertex to neighbors
    final neighborDirections = <Direction>[];
    for (final e in vertexEdges) {
      final neighbor = vertices[e.a == vertexIndex ? e.b : e.a];
      final diff = (neighbor.x - vertex.x, neighbor.y - vertex.y);
      assert((diff.$1.abs() == 1 && diff.$2 == 0) ||
          (diff.$1 == 0 && diff.$2.abs() == 1));
      neighborDirections.add(Direction.fromDiff(diff));
    }
    assert(neighborDirections.length == vertexEdges.length);

    // Select matiching cell code
    switch (neighborDirections.length) {
      case 0:
        return (0, 3);
      case 1:
        return switch (neighborDirections[0]) {
          Direction.up => (0, 2),
          Direction.right => (1, 3),
          Direction.down => (0, 0),
          Direction.left => (3, 3),
        };
      case 2:
        neighborDirections.sort();
        return (2, 3);
      case 3:
        final blockedDirection = Direction.values
            .singleWhere((d) => !neighborDirections.contains(d));
        return switch (blockedDirection) {
          Direction.up => (2, 0),
          Direction.right => (3, 1),
          Direction.down => (2, 2),
          Direction.left => (1, 1),
        };
      case 4:
        return (2, 1);
      default:
        throw ArgumentError(
            'Vertex edges length must always be in range [0, 4]');
    }
  }
}

enum Direction implements Comparable<Direction> {
  up(0, -1),
  left(-1, 0),
  right(1, 0),
  down(0, 1);

  const Direction(this.x, this.y);

  static Direction fromDiff((int, int) diff) {
    return Direction.values
        .singleWhere((d) => d.x == diff.$1 && d.y == diff.$2);
  }

  final int x;
  final int y;

  @override
  int compareTo(Direction other) {
    return index - other.index;
  }
}
