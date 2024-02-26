import 'package:flutter/material.dart';

import 'package:shortly/global/color.dart';

class Button extends StatefulWidget {
  final String displayText;
  final Radius radius;
  final TextStyle textStyle;
  final VoidCallback? onPressed;
  final Color? clickedColor;

  const Button({
    super.key,
    required this.displayText,
    required this.radius,
    this.textStyle = const TextStyle(),
    this.onPressed,
    this.clickedColor,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isHovered = false;
  Color _buttonHoverColor = const Color.fromARGB(255, 164, 250, 248);
  Color _buttonUnHoverColor = CustomColors.primaryCyan;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHovered(true),
      onExit: (_) => _setHovered(false),
      child: ElevatedButton(
        onPressed: () => {
          widget.onPressed!(),
          if (widget.clickedColor != null)
            {
              setState(() {
                _buttonHoverColor = widget.clickedColor ?? _buttonHoverColor;
                _buttonUnHoverColor =
                    widget.clickedColor ?? _buttonUnHoverColor;
              })
            },
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: _isHovered ? _buttonHoverColor : _buttonUnHoverColor,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(widget.radius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 30.0,
          ),
        ),
        child: Text(
          widget.displayText,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.white,
                fontSize: widget.textStyle.fontSize,
              ),
        ),
      ),
    );
  }

  void _setHovered(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
