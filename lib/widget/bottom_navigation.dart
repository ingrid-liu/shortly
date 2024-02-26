import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/global/color.dart';
import 'package:shortly/widget/link.dart';
import 'package:shortly/widget/icon.dart';

import 'package:shortly/model/hyperlink.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List bottomLinkList = [
    [
      HyperLink(displayText: 'Features', url: '', textColor: Colors.white),
      HyperLink(displayText: 'Link Shortening', url: ''),
      HyperLink(displayText: 'Branded Links', url: '#'),
      HyperLink(displayText: 'Analytics', url: '#'),
    ],
    [
      HyperLink(displayText: 'Resources', url: '', textColor: Colors.white),
      HyperLink(displayText: 'Blog', url: ''),
      HyperLink(displayText: 'Developers', url: ''),
      HyperLink(displayText: 'Support', url: ''),
    ],
    [
      HyperLink(displayText: 'Company', url: '', textColor: Colors.white),
      HyperLink(displayText: 'About', url: ''),
      HyperLink(displayText: 'Our Team', url: ''),
      HyperLink(displayText: 'Careers', url: ''),
      HyperLink(displayText: 'Contact', url: ''),
    ],
  ];

  List iconList = [
    'assets/images/icon-facebook.svg',
    'assets/images/icon-twitter.svg',
    'assets/images/icon-pinterest.svg',
    'assets/images/icon-instagram.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 30.0, left: 170.0, right: 170.0, bottom: 30.0),
      color: CustomColors.neutralVeryDarkViolet,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/images/logo.svg',
            height: 35,
            colorFilter: (const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            )),
          ),
          const SizedBox(width: 40),
          for (var linkList in bottomLinkList) _buildColumnWithLinks(linkList),
          Row(
            children: iconList
                .map(
                  (icon) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HoverIcon(
                      assetPath: icon,
                      hoverColor: CustomColors.primaryCyan,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildColumnWithLinks(List<HyperLink> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Link(
            hyperLink:
                links[0].copyWith(highlightedColor: CustomColors.primaryCyan)),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: links
              .sublist(1)
              .map((link) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Link(
                    hyperLink: link.copyWith(
                        highlightedColor: CustomColors.primaryCyan,
                        fontStyle:
                            const TextStyle(fontWeight: FontWeight.w500)),
                  )))
              .toList(),
        ),
      ],
    );
  }
}
