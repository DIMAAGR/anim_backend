import 'package:anim_backend/modules/authentication/authentication_module.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get('/', () => Response.ok('@2023 - Anim backend maded in dart')),
        Route.module('/authentication', module: AuthenticationModule()),
      ];
}
