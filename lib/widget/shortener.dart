import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/api/url_shorten.dart';
import 'package:shortly/global/color.dart';
import 'package:shortly/widget/button.dart';
import 'package:shortly/widget/shortened_url_entry.dart';

class Shortener extends StatefulWidget {
  const Shortener({super.key});

  @override
  State<Shortener> createState() => _ShortenerState();
}

class _ShortenerState extends State<Shortener> {
  final urlInputController = TextEditingController();
  bool _inputError = false;
  List urls = [];

  @override
  void dispose() {
    urlInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 170, right: 170, top: 50),
      child: Column(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomColors.primaryDarkViolet,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SvgPicture.asset(
                      'assets/images/bg-shorten-desktop.svg',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 168, width: 1110),
              Padding(
                padding: const EdgeInsets.only(top: 55, left: 50, right: 50),
                child: Flex(
                  direction:
                      screenSize.width < 800 ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: urlInputController,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          labelStyle: Theme.of(context).textTheme.bodyMedium,
                          hintText: 'Shorten a link here...',
                          hintStyle:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: CustomColors.neutralGray,
                                  ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: CustomColors.secondaryRed, width: 2),
                          ),
                          errorText: _inputError ? 'Please add a link' : null,
                          errorStyle: const TextStyle(
                            color: CustomColors.secondaryRed,
                            fontStyle: FontStyle.italic,
                          ),
                          errorBorder: _inputError
                              ? OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                      color: CustomColors.secondaryRed,
                                      width: 2),
                                )
                              : null,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Button(
                      displayText: 'Shorten It!',
                      radius: const Radius.circular(5),
                      onPressed: () => onPressed(),
                    ),
                  ],
                ),
              )
            ],
          ),
          for (var url in urls)
            ShortenedUrlEntry(
              rawUrl: url['rawUrl'],
              shortenedUrl: url['shortenedUrl'],
            ),
        ],
      ),
    );
  }

  Future<void> onPressed() async {
    if (urlInputController.text.isEmpty) {
      setState(() {
        _inputError = true;
      });
      return;
    }
    setState(() {
      _inputError = false;
    });
    String shortenedUrl = await APIs.getShortenedUrl(urlInputController.text);
    setState(() {
      if (urls.any((url) => url['rawUrl'] == urlInputController.text)) {
        return;
      }
      urls.add({
        'rawUrl': urlInputController.text,
        'shortenedUrl': shortenedUrl,
      });
    });
  }
}
