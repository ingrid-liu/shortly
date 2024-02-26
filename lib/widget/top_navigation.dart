import 'package:flutter/material.dart';
import 'package:shortly/global/color.dart';
import 'package:shortly/model/hyperlink.dart';
import 'package:shortly/widget/button.dart';
import 'package:shortly/widget/link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNav extends StatefulWidget {
  const TopNav({super.key});

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  List linkList = [
    HyperLink(displayText: 'Features', url: ''),
    HyperLink(displayText: 'Pricing', url: ''),
    HyperLink(displayText: 'Resources', url: ''),
  ];

  String loginButton = 'Login';
  String signUpButton = 'Sign Up';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          height: 35,
        ),
        SizedBox(
          width: screenSize.width * 0.03,
        ),
        Expanded(
          child: Row(
            children: linkList
                .map(
                  (link) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Link(hyperLink: link),
                  ),
                )
                .toList(),
          ),
        ),
        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(loginButton,
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            const SizedBox(width: 10),
            const Button(
              displayText: 'Sign Up',
              radius: Radius.circular(50),
            ),
          ],
        ),
      ],
    );
  }
}
