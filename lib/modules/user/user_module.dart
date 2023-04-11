import 'package:anim_backend/modules/user/functions/get_user_data.dart';
import 'package:shelf_modular/shelf_modular.dart';

class UserModule extends Module {
  @override
  List<ModularRoute> get routes => [
        Route.get('/get_user_data/:uuid', (ModularArguments args) => UserData.getUserData(args.params['uuid'])),
        Route.get('/delete_user/:uuid', (ModularArguments args) => UserData.getUserData(args.params['uuid'])),
        Route.put('/change_user_data/:uuid', (ModularArguments args) => UserData.getUserData(args.params['uuid'])),
      ];
}
