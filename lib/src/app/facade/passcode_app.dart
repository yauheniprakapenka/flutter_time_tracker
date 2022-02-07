import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_panel/number_panel.dart';

import '../../ui/features/passcode/navigator/passcode_flow_navigator.dart';
import '../../ui/features/passcode/pages/observers/cancel_button_observer.dart';
import '../../ui/shared/theme/theme_data/app_theme_data.dart';
import '../di/cancel_button_service_locator.dart';

class PasscodeApp extends StatefulWidget {
  final PasscodeFlow _passcodeFlow;
  final Function(Result result) _onResult;
  final GestureTapCallback _onCancelPressed;

  PasscodeApp({
    Key? key,
    required PasscodeFlow passcodeFlow,
    required int passcodeLength,
    required Function(Result result) onResult,
    required GestureTapCallback onCancelPressed,
  })  : _passcodeFlow = passcodeFlow,
        _onResult = onResult,
        _onCancelPressed = onCancelPressed,
        super(key: key) {
    PasscodeConfigServiceLocator.instance.register(passcodeLength);
  }

  @override
  State<PasscodeApp> createState() => _PasscodeAppState();
}

class _PasscodeAppState extends State<PasscodeApp> {
  @override
  void initState() {
    super.initState();
    CancelButtonServiceLocator.instance.register();
    final cancelButtonObserver = CancelButtonServiceLocator.instance.get<CancelButtonObserver>();
    cancelButtonObserver.controller.stream.listen((event) {
      widget._onCancelPressed();
    });

    ResultServiceLocator.instance.register();
    final resultObserver = ResultServiceLocator.instance.get<ResultObserver>();
    resultObserver.controller.stream.listen((result) {
      widget._onResult(result);
    });
  }

  @override
  void dispose() {
    CancelButtonServiceLocator.instance.dispose();
    ResultServiceLocator.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PasscodeBloc>(create: (_) => PasscodeBloc(widget._passcodeFlow)),
        BlocProvider<NumberPanelBloc>(create: (_) => NumberPanelBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData().call(),
        home: const PasscodeFlowNavigator(),
      ),
    );
  }
}
