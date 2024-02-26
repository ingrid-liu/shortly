import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shortly/global/color.dart';
import 'package:shortly/widget/button.dart';

class ShortenedUrlEntry extends StatefulWidget {
  final String rawUrl;
  final String shortenedUrl;
  final mobileView;

  const ShortenedUrlEntry({
    super.key,
    required this.rawUrl,
    required this.shortenedUrl,
    this.mobileView = false,
  });

  @override
  State<ShortenedUrlEntry> createState() => _ShortenedUrlEntryState();
}

class _ShortenedUrlEntryState extends State<ShortenedUrlEntry> {
  bool _copied = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Flex(
          direction: widget.mobileView ? Axis.vertical : Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: widget.mobileView
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Text(
              widget.rawUrl,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: CustomColors.neutralVeryDarkViolet,
                  ),
            ),
            Divider(
              color: Color.fromARGB(133, 227, 223, 223),
              thickness: widget.mobileView ? 2 : 0,
            ),
            Flex(
              direction: widget.mobileView ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: widget.mobileView
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    widget.shortenedUrl,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: CustomColors.primaryCyan,
                        ),
                  ),
                ),
                const SizedBox(width: 30),
                SizedBox(
                  width: widget.mobileView ? double.infinity : null,
                  child: Button(
                    displayText: _copied ? 'copied!' : "Copy",
                    radius: const Radius.circular(5),
                    textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white,
                        ),
                    onPressed: onCopy,
                    clickedColor: CustomColors.primaryDarkViolet,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCopy() {
    Clipboard.setData(ClipboardData(text: widget.shortenedUrl)).then((_) {});
    setState(() {
      _copied = true;
    });
  }
}
