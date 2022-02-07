import 'package:flutter/material.dart';

import 'home_page.dart';

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
