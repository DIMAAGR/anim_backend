import 'package:shelf/shelf.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get('/', () => Response.ok('@2023 - Anim backend maded in dart')),
        Route.get('/test_return_custom_message/:message', (ModularArguments args) => Response.ok('It\'s a custom message test the message is: ${Uri.decodeFull(args.params['message'].toString())}'))
      ];
}
