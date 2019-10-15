import 'package:flutter_course/models/secret.dart';

class SecretsProvider {
  Secret _loadedMapsApiKey;

  Future<Secret> getMapsApiKey() async {
    if (_loadedMapsApiKey == null) {
      final secret =
          await const SecretLoader(secretPath: 'assets/secrets.json').load();
      _loadedMapsApiKey = secret;
    }
    return _loadedMapsApiKey;
  }
}
