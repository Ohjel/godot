import 'dart:convert' show json;
import 'package:server/maze/generation.dart';
import 'package:server/maze/utils.dart';
import 'package:server/solving.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Server {
  final String host;
  final int port;

  Server({required this.host, required this.port});

  Future<void> run() async {
    final router = Router()
      ..get('/maze', _printRandomMaze)
      ..all('/<ignored|.*>', _echoTest);

    final pipeline =
        const Pipeline().addMiddleware(logRequests()).addHandler(router.call);

    final server = await shelf_io.serve(pipeline, host, port);
    server.autoCompress = true;
    print('Serving at http://${server.address.host}:${server.port}');
  }

  Response _echoTest(Request request) {
    return Response.ok('Request:\n${request.method} /${request.url}\n'
        '\nParams:\n${request.params}\n'
        '\nHeaders:\n${request.headersAll}\n');
  }

  Future<Response> _printRandomMaze(Request request) async {
    final width = int.parse(request.url.queryParameters['width'] ?? '10');
    final height = int.parse(request.url.queryParameters['height'] ?? '10');
    final solved = bool.parse(request.url.queryParameters['solved'] ?? 'false');
    final start = int.parse(request.url.queryParameters['start'] ?? '0');
    final end = int.parse(
        request.url.queryParameters['end'] ?? '${width * height - 1}');

    final maze = loopErasedRandomWalks(width: width, height: height);
    final path = solved ? solveMaze(maze, start, end) : null;

    final body = '''
${formatMazeToString(maze, path)}

---

${json.encode(maze.toJson())}
''';
    return Response.ok(body, headers: {
      'Content-Type': 'text/plain; charset=utf-8',
    });
  }
}
