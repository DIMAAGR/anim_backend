import 'package:anim_backend/modules/authentication/functions/login.dart';
import 'package:shelf_modular/shelf_modular.dart';

class AuthenticationModule extends Module {

  @override
  List<ModularRoute> get routes => [
    Route.get('/login/:email/:password', (ModularArguments args) => Login().doLogin(args.params['email'], args.params['password'])),
  ]; 
}