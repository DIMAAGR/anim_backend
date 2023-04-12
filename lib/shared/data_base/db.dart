import 'package:hive/hive.dart';

class HiveDB {
  static const _privateKey = '7d355ab078af4024bec780539ae059a8';


  // Getters
  static Future<CollectionBox<Map>> get sessionsDB async => (await _sessionCollection()).openBox<Map>('saved_sessions');
  static Future<CollectionBox<Map>> get usersDB async => (await _usersCollection()).openBox<Map>('users');


  // Collections
  static Future<BoxCollection> _sessionCollection() => _newCollection('sessions', 'saved_sessions');
  static Future<BoxCollection> _usersCollection() => _newCollection('users', 'users');


  // New Collections Method
  static Future<BoxCollection> _newCollection(String collectionName, String collection) => BoxCollection.open(
        collectionName,
        {collection},
        key: HiveAesCipher(_privateKey.codeUnits),
        path: './$collectionName/',
      );
}
