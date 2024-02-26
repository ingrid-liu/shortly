import 'package:flutter/material.dart';

import '../model/hyperlink.dart';

class Link extends StatefulWidget {
  final HyperLink hyperLink;

  const Link({
    super.key,
    required this.hyperLink,
  });

  @override
  State<Link> createState() => _LinkState();
}

class _LinkState extends State<Link> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: GestureDetector(
        onTap: () => _launchURL(widget.hyperLink.url),
        child: Text(
          widget.hyperLink.displayText,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: _isHovering
                    ? widget.hyperLink.highlightedColor
                    : widget.hyperLink.textColor,
              ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {}
  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }
}
