import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return Center(
      child: SvgPicture.asset(
        'assets/icons/delete.svg',
      ),
    );
  }
}
