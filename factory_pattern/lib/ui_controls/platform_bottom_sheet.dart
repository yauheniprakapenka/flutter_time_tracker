import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:factory_pattern/model/bottom_sheet_model.dart';

abstract class PlatformBottomSheet {
  factory PlatformBottomSheet(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return _CupertinoActionSheet();
      default:
        return _ModalBottomSheet();
    }
  }

  void build({
    @required BuildContext context,
    String title,
    String message,
    bool cancelButton,
    @required List<BottomSheetButtonModel> bottomSheetButtons,
  });
}

class _ModalBottomSheet implements PlatformBottomSheet {
  @override
  void build({
    @required BuildContext context,
    String title,
    String message,
    bool cancelButton,
    @required List<BottomSheetButtonModel> bottomSheetButtons,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: bottomSheetButtons
                .map(
                  (button) => ListTile(
                    title: Text(button.buttonTitle),
                    leading: Icon(button.iconData),
                    onTap: () {
                      button.onPressed();
                      Navigator.of(context).pop();
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

class _CupertinoActionSheet implements PlatformBottomSheet {
  @override
  void build({
    @required BuildContext context,
    String title,
    String message,
    bool cancelButton,
    @required List<BottomSheetButtonModel> bottomSheetButtons,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(title),
          message: Text(message),
          cancelButton: cancelButton
              ? CupertinoActionSheetAction(
                  child: Text('Отмена'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : null,
          actions: bottomSheetButtons
              .map(
                (button) => CupertinoActionSheetAction(
                  child: Text(button.buttonTitle),
                  isDestructiveAction: button.isDestructive,
                  isDefaultAction: button.isDefaultAction,
                  onPressed: () {
                    button.onPressed();
                    Navigator.of(context).pop();
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
