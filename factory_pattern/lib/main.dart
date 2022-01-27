import 'package:access_key/ui/components/number_access_buttons/number_access_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: NumberAccessButtons(),
      ),
    );
  }
}
