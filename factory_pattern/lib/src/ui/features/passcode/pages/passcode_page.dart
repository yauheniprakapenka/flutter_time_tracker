import 'package:flutter/material.dart';
import 'package:number_panel/number_panel.dart';

import '../composites/passcode_indicator_view.dart';
import '../widgets/text_info.dart';

class PasscodePage extends StatelessWidget {
  const PasscodePage({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                child: const Text('Отмена'),
                onPressed: () {},
              ),
            ),
            const SizedBox(height: 22),
            const TextInfo(text: 'Введите ключ доступа'),
            const SizedBox(height: 22),
            const PasscodeIndicatorView(),
            const SizedBox(height: 52),
            const NumberPanel(),
          ],
        ),
      ),
    );
  }
}

class Aaaa extends StatefulWidget {
  const Aaaa({Key? key}) : super(key: key);

  @override
  State<Aaaa> createState() => _AaaaState();
}

class _AaaaState extends State<Aaaa> {
  @override
  Widget build(context) {
    throw UnimplementedError();
  }
}