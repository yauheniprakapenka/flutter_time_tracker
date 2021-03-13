import 'package:flutter/material.dart';
import 'package:factory_pattern/platform_button.dart';
import 'package:factory_pattern/platform_switch.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    TargetPlatform _currentPlatform = Theme.of(context).platform;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PlatformButton(_currentPlatform).build(
                context: context,
                child: Text("Button"),
                onPressed: () {
                  print("Button tapped");
                }),
            PlatformSwitch(_currentPlatform).build(
              value: _switchValue,
              onChanged: (bool newValue) {
                setState(() {
                  _switchValue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
