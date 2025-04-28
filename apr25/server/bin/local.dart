import 'package:server/server.dart';

Future<void> main(List<String> arguments) async {
  final server = Server(host: 'localhost', port: 4020);
  await server.run();
}
