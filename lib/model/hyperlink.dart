import 'package:flutter/material.dart';
import 'package:shortly/global/color.dart';

class HyperLink {
  final String displayText;
  final String url;
  final Color textColor;
  final Color highlightedColor;
  final TextStyle fontStyle;

  HyperLink({
    required this.displayText,
    required this.url,
    this.textColor = CustomColors.neutralGray,
    this.highlightedColor = Colors.black,
    this.fontStyle = const TextStyle(
      fontWeight: FontWeight.w500,
    ),
  });

  HyperLink copyWith({
    String? displayText,
    String? url,
    Color? textColor,
    Color? highlightedColor,
    TextStyle? fontStyle,
  }) {
    return HyperLink(
      displayText: displayText ?? this.displayText,
      url: url ?? this.url,
      textColor: textColor ?? this.textColor,
      highlightedColor: highlightedColor ?? this.highlightedColor,
      fontStyle: fontStyle ?? this.fontStyle,
    );
  }
}
