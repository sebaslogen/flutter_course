import 'package:flutter/material.dart';
import 'package:flutter_course/models/secret.dart';
import 'package:flutter_course/providers/secrets_provider.dart';
import 'package:provider/provider.dart';

class ApisProviderWidget extends StatelessWidget {
  const ApisProviderWidget({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Secret>(
      future: SecretsProvider().getMapsApiKey(),
      builder: (ctx, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Provider.value(value: snapshot.data, child: child),
    );
  }
}
