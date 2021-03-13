import 'package:flutter/material.dart';
import 'package:factory_pattern/ui_controls/widget_factory.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetFactory.buildButton(
                context: context,
                child: Text("Button"),
                onPressed: () {
                  print("button tapped");
                }),
            WidgetFactory.buildSwitch(
                context: context,
                value: _switchValue,
                onChanged: (bool newValue) {
                  setState(() {
                    _switchValue = newValue;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
