import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Security {
  static String get filename {
    if (kReleaseMode) {
      return '.env.prod';
    }

    return '.env.dev';
  }

  static String get Cli_token {
    return dotenv.env['FIREBASE_CLI_TOKEN'] ?? '';
  }
}
