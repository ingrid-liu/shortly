import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shortly/global/color.dart';

class HyperLink {
  final String displayText;
  final String url;
  final Color textColor;
  final Color highlightedColor;

  HyperLink({
    required this.displayText,
    required this.url,
    this.textColor = CustomColors.neutralGray,
    this.highlightedColor = Colors.black,
  });
}
