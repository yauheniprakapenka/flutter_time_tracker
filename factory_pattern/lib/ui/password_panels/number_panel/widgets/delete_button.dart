import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../services/service_locator.dart';
import '../../../theme/size/interface/i_app_size.dart';

class DeleteButton extends StatelessWidget {
  final GestureTapCallback onPressed;

  const DeleteButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(context) {
    final appSize = ServiceLocator.instance.get<IAppSize>();
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        width: appSize.passwordButtonSize,
        height: appSize.passwordButtonSize,
        child: const Center(
          child: _DeleteIcon(),
        ),
      ),
    );
  }
}

class _DeleteIcon extends StatelessWidget {
  static const _widthIcon = 46.0;
  static const _heigthIcon = 34.0;
  static const _crossSize = 18.0;
  static const _leftPadding = _widthIcon - _heigthIcon;

  const _DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/icons/delete/rectangle.svg',
          color: Theme.of(context).colorScheme.surface,
          width: _widthIcon,
          height: _heigthIcon,
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.only(left: _leftPadding),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/delete/cross.svg',
                color: Theme.of(context).colorScheme.onSurface,
                width: _crossSize,
                height: _crossSize,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
