
import 'package:server/maze/maze.dart';
import 'package:test/test.dart';

void main() {
  test('Direction sorting', () {
    final directionList1 = [Direction.down, Direction.up];
    expect(directionList1..sort(), [Direction.up, Direction.down]);
    final directionList2 = [Direction.left, Direction.right, Direction.up];
    expect(directionList2..sort(), [Direction.up, Direction.left, Direction.right]);
  });
}
