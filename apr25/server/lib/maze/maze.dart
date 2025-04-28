import 'package:json_annotation/json_annotation.dart';

part 'maze.g.dart';

typedef MazeVertex = ({int x, int y});
typedef MazeEdge = ({int a, int b});

@JsonSerializable()
class Maze {
  final int width;
  final int height;
  final int vertexSize;
  final List<MazeVertex> vertices;
  final List<MazeEdge> edges;

  const Maze(
      {required this.vertices,
      required this.edges,
      required this.vertexSize,
      required this.width,
      required this.height});

  factory Maze.fromJson(Map<String, dynamic> json) => _$MazeFromJson(json);

  Map<String, dynamic> toJson() => _$MazeToJson(this);
}
