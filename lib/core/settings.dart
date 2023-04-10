import 'dart:async';
import 'dart:io';

import 'package:anim_backend/core/constants.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_modular/shelf_modular.dart';

class BackendSettings {
  FutureOr<HttpServer> inicializateApp(Module module) async {
    return createServer(Modular(
      module: module,
      middlewares: [logRequests()],
    ));
  }

 FutureOr<HttpServer> createServer(FutureOr<Response> Function(Request) modular) async => await io.serve(modular, Const.serverIP, Const.port);
}
