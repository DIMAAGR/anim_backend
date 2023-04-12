class Log {
  static wellcomeMessage(String address, String port) {
    print('\n==========================');
    print('Server Started with Success:');
    print('ADDRESS: $address');
    print('PORT: $port');
    print('==========================\n');
  }

  static error(String errorCode, String message) {
    print('\n========================================================');
    print('| an error occourred: $errorCode');
    print('| $message');
    print('========================================================\n');
  }

    static info(String errorCode, String message) {
    print('\n========================================================');
    print('| you have a information: $errorCode');
    print('| $message');
    print('========================================================\n');
  }
}
