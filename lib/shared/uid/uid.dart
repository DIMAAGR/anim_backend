import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';

class UID {
  String? id;
  
  UID.generateID() {
    Uuid uuid = Uuid();
    id = uuid.v4().substring(0, 10);
  }
  
  int idToInt() {
    List<int> idBytes = id!.codeUnits;
    Digest hash = sha256.convert(idBytes);
    int hashInt = int.parse(hash.toString().substring(0, 16), radix: 16);
    return hashInt;
  }
}