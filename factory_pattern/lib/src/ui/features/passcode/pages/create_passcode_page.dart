import 'package:flutter/material.dart';
import 'package:number_panel/number_panel.dart';

import '../widgets/task_text.dart';
import 'adapters/passcode_adapter.dart';

class CreatePasscodePage extends StatelessWidget {
  const CreatePasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                throw UnimplementedError();
              },
            ),
          ),
          const SizedBox(height: 22),
          const TaskText(text: 'Придумайте ключ доступа'),
          const SizedBox(height: 22),
          const PasscodeAdapter(),
          const SizedBox(height: 52),
          const NumberPanel(),
        ],
      ),
    );
  }
}
