import 'package:server/maze/generation.dart';
import 'package:server/maze/utils.dart';
import 'package:test/test.dart';

void main() {
  test('One cell maze', () {
    var maze = loopErasedRandomWalks(width: 1, height: 1);
    expect(maze.vertices, [(x: 0, y: 0)]);
    expect(maze.edges, []);
  });

  test('Medium maze', () {
    var maze = loopErasedRandomWalks(width: 2, height: 3);
    print(formatMazeToString(maze));
    print(maze.edges);
    print(maze.vertices);
  });

  test('Large maze', () {
    var maze = loopErasedRandomWalks(width: 25, height: 50);
    print(maze);
  });
}
