import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'passcode_navigator_configurator.dart';
import '../domain/domain.dart';
import '../ui/ui.dart';

class PasscodeNavigator extends StatefulWidget {
  final PasscodeNavigatorConfigurator passcodeNavigatorConfig;
  final Function(Result result) _onResult;
  final GestureTapCallback _onCancelPressed;

  PasscodeNavigator({
    Key? key,
    required this.passcodeNavigatorConfig,
    required Function(Result result) onResult,
    required GestureTapCallback onCancelPressed,
  })  : _onResult = onResult,
        _onCancelPressed = onCancelPressed,
        super(key: key) {
    DeleteIconServiceLocator.instance.register(passcodeNavigatorConfig.deleteIcon);
    LogoServiceLocator.instance.register(passcodeNavigatorConfig.logo);
    LocalizationServiceLocator.instance.register(passcodeNavigatorConfig.localization);
    ColorServiceLocator.instance.register(passcodeNavigatorConfig.color);
    PasscodeConfigServiceLocator.instance.register(passcodeNavigatorConfig.passcodeLength);
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
        BlocProvider<PasscodeBloc>(
            create: (_) => PasscodeBloc(widget.passcodeNavigatorConfig.passcodeFlow)),
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
