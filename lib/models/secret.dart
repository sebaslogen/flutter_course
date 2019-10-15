import 'dart:async' show Future;
import 'dart:convert' show json;

import 'package:flutter/services.dart' show rootBundle;

class SecretLoader {
  const SecretLoader({this.secretPath});

  final String secretPath;

  Future<Secret> load() {
    return rootBundle.loadStructuredData<Secret>(secretPath, (jsonStr) async {
      return Secret.fromJson(json.decode(jsonStr));
    });
  }
}

class Secret {
  Secret({this.apiKey = ''});

  final String apiKey;

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(apiKey: jsonMap['maps_api_key']);
  }
}
