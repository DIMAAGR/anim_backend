 
  // NOTE: to change the server IP and port please go to lib/core/constants.dart and change the IP and ports constants values.

import 'dart:io';

import 'package:anim_backend/app_module.dart';
import 'package:anim_backend/core/settings.dart';
import 'package:anim_backend/log/log.dart';

void main(List<String> arguments) async{
  
  HttpServer server = await BackendSettings().inicializateApp(AppModule());

  Log.wellcomeMessage(server.address.address, server.port.toString());
  
  
}
