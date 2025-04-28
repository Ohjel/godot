import 'package:json_annotation/json_annotation.dart';
import 'maze/maze.dart';

typedef Point = ({double x, double y});

@JsonSerializable()
class GameState {
  final Maze maze;
  final List<Point> path;

  const GameState({required this.maze, this.path = const []});
}
