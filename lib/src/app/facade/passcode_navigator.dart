import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../../ui/ui.dart';

class PasscodeNavigator extends StatefulWidget {
  final PasscodeFlow _passcodeFlow;
  final Function(Result result) _onResult;
  final GestureTapCallback _onCancelPressed;

  PasscodeNavigator({
    Key? key,
    required PasscodeFlow passcodeFlow,
    required int passcodeLength,
    required Function(Result result) onResult,
    required GestureTapCallback onCancelPressed,
    required ILocalization localization,
    required IColor color,
    Widget? logo,
  })  : _passcodeFlow = passcodeFlow,
        _onResult = onResult,
        _onCancelPressed = onCancelPressed,
        super(key: key) {
    LogoServiceLocator.instance.register(logo);      
    LocalizationServiceLocator.instance.register(localization);
    ColorServiceLocator.instance.register(color);
    PasscodeConfigServiceLocator.instance.register(passcodeLength);
  }

  @override
  State<PasscodeNavigator> createState() => _PasscodeNavigatorState();
}

class _PasscodeNavigatorState extends State<PasscodeNavigator> {
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
