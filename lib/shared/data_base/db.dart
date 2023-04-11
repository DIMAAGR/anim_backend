import 'package:hive/hive.dart';

class HiveDB {
  static const _privateKey = '7d355ab0-78af-4024-bec7-8Handler not correct0539ae059a8';

  static Future<CollectionBox<Map>> get sessionsDB async => (await _sessionCollection()).openBox<Map>('saved_sessions');

  static Future<BoxCollection> _sessionCollection() {
    return BoxCollection.open(
      'sessions',
      {'saved_sessions'},
      //   key: HiveAesCipher(_privateKey.codeUnits),
      path: './sessions/',
    );
  }
}
