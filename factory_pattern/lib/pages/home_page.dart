import 'package:factory_pattern/model/bottom_sheet_model.dart';
import 'package:flutter/cupertino.dart';
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
                child: Text("Platform Button"),
                onPressed: () {}),
            WidgetFactory.buildSwitch(
                context: context,
                value: _switchValue,
                onChanged: (bool newValue) {
                  setState(() {
                    _switchValue = newValue;
                  });
                }),
            TextButton(
              child: Text("Show platform bottom sheet"),
              onPressed: () {
                WidgetFactory.buildBottomSheet(
                    context: context,
                    title: 'This is title',
                    message: 'This is message',
                    bottomSheetButtons: [
                      BottomSheetButtonModel(
                        buttonTitle: 'first button',
                        iconData: Icons.access_alarms,
                        onPressed: () {
                          print('firts onPressed');
                        },
                      ),
                      BottomSheetButtonModel(
                        buttonTitle: 'second destractive button',
                        iconData: Icons.phone,
                        isDestructive: true,
                        onPressed: () {
                          print('second onPressed');
                        },
                      ),
                      BottomSheetButtonModel(
                        buttonTitle: 'third default button',
                        isDefaultAction: true,
                        onPressed: () {
                          print('third onPressed');
                        },
                      ),
                    ]);
              },
            )
          ],
        ),
      ),
    );
  }
}
