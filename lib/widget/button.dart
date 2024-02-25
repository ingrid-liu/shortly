import 'package:flutter/material.dart';

import '../global/color.dart';

class Button extends StatefulWidget {
  final String displayText;
  final Radius radius;

  const Button({
    super.key,
    required this.displayText,
    required this.radius,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isHovered = false;
  final Color _buttonHoverColor = const Color.fromARGB(255, 164, 250, 248);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor:
              _isHovered ? _buttonHoverColor : CustomColors.primaryCyan,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(widget.displayText,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                )),
      ),
    );
  }

  void _setHovered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
