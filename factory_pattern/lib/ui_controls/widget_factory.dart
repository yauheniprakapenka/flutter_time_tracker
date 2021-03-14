import 'package:factory_pattern/ui_controls/platform_button.dart';
import 'package:factory_pattern/ui_controls/platform_switch.dart';
import 'package:factory_pattern/ui_controls/platform_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:factory_pattern/model/bottom_sheet_model.dart';

class WidgetFactory {
  static Widget buildButton({
    @required BuildContext context,
    @required Widget child,
    @required VoidCallback onPressed,
  }) {
    return PlatformButton(Theme.of(context).platform).build(
      child: child,
      onPressed: onPressed,
    );
  }

  static Widget buildSwitch({
    @required BuildContext context,
    @required bool value,
    @required ValueChanged<bool> onChanged,
  }) {
    return PlatformSwitch(Theme.of(context).platform).build(
      value: value,
      onChanged: onChanged,
    );
  }

  /// `iOS` Title of the action sheet. Optional parameter.
  ///
  /// `iOS` Message describes the action sheet. Optional parameter.
  ///
  /// `iOS` cancelButton is grouped separately from the other actions. Default is true. Optional parameter.
  ///
  ///![How it looks on Android and iOS](https://flutter.github.io/assets-for-api-docs/assets/widgets/icon.png)
  ///
  /// Example usage:
  ///
  /// ```
  /// TextButton(
  ///   child: Text("Show platform bottom sheet"),
  ///   onPressed: () {
  ///     WidgetFactory.buildBottomSheet(
  ///       context: context,
  ///       title: 'This is title',
  ///       message: 'This is message',
  ///       bottomSheetButtons: [
  ///         BottomSheetButtonModel(
  ///         buttonTitle: 'first button',
  ///         iconData: Icons.access_alarms,
  ///         onPressed: () {
  ///           print('firts onPressed');
  ///         },
  ///       ),
  ///       BottomSheetButtonModel(
  ///         buttonTitle: 'second destractive button',
  ///         iconData: Icons.phone,
  ///         isDestructive: true,
  ///         onPressed: () {
  ///           print('second onPressed');
  ///         },
  ///       ),
  ///       BottomSheetButtonModel(
  ///         buttonTitle: 'third default button',
  ///         isDefaultAction: true,
  ///         onPressed: () {
  ///           print('third onPressed');
  ///         },
  ///       ),
  ///     ]);
  ///   },
  /// )
  /// ```
  static void buildBottomSheet({
    @required BuildContext context,
    String title,
    String message,
    bool cancelButton = true,
    @required List<BottomSheetButtonModel> bottomSheetButtons,
  }) {
    PlatformBottomSheet(Theme.of(context).platform).build(
      context: context,
      title: title,
      message: message,
      cancelButton: cancelButton,
      bottomSheetButtons: bottomSheetButtons,
    );
  }
}
