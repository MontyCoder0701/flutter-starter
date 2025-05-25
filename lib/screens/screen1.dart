import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(AppLocalizations.of(context)!.helloWorld));
  }
}
