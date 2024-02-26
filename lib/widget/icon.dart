import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HoverIcon extends StatefulWidget {
  final String assetPath;
  final Color hoverColor;
  final Color color;

  const HoverIcon({
    super.key,
    required this.assetPath,
    required this.hoverColor,
    this.color = Colors.white,
  });

  @override
  _HoverIconState createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => _setHovering(true),
      onExit: (event) => _setHovering(false),
      child: SvgPicture.asset(widget.assetPath,
          colorFilter: ColorFilter.mode(
              _isHovering ? widget.hoverColor : widget.color, BlendMode.srcIn),
          height: 25),
    );
  }

  void _setHovering(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}
