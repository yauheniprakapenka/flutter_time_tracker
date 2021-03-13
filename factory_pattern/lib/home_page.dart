import 'package:flutter/material.dart';
import 'package:factory_pattern/platform_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TargetPlatform _currentPlatform = Theme.of(context).platform;

    return Scaffold(
      body: Center(
        child: PlatformButton(_currentPlatform).build(
            context: context,
            child: Text("Button"),
            onPressed: () {
              print("Button tapped");
            }),
      ),
    );
  }
}
