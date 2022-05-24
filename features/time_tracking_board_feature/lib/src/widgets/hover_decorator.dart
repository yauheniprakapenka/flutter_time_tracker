import 'package:flutter/material.dart';

class HoverDecorator extends StatefulWidget {
  final Widget Function(bool isHovered) builder;

  const HoverDecorator({required this.builder});

  @override
  _HoverDecoratorState createState() => _HoverDecoratorState();
}

class _HoverDecoratorState extends State<HoverDecorator> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _changeHover(),
      onExit: (_) => _changeHover(),
      child: widget.builder(_isHovered),
    );
  }

  void _changeHover() {
    setState(() {
      _isHovered = !_isHovered;
    });
  }
}
