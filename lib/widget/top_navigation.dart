import 'package:flutter/material.dart';
import 'package:shortly/global/color.dart';
import 'package:shortly/model/hyperlink.dart';
import 'package:shortly/widget/button.dart';
import 'package:shortly/widget/link.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNav extends StatefulWidget {
  final bool mobileView;

  const TopNav({super.key, this.mobileView = false});

  @override
  State<TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<TopNav> {
  List linkList = [
    HyperLink(displayText: 'Features', url: ''),
    HyperLink(displayText: 'Pricing', url: ''),
    HyperLink(displayText: 'Resources', url: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return widget.mobileView ? buildMobileTopNav() : buildDesktopTopNav();
  }

  Widget buildDesktopTopNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          height: 35,
        ),
        const SizedBox(
          width: 50,
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
        TextButton(
          onPressed: () {},
          child: Text("Login", style: Theme.of(context).textTheme.bodySmall),
        ),
        const SizedBox(width: 10),
        const Button(
          displayText: 'Sign Up',
          radius: Radius.circular(50),
        ),
      ],
    );
  }

  Widget buildMobileTopNav() {
    Size screenSize = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg',
          height: 35,
        ),
        IconButton(
          onPressed: () {
            showMenu(
                context: context,
                elevation: 0,
                color: CustomColors.primaryDarkViolet,
                position: const RelativeRect.fromLTRB(30, 100, 30, 0),
                constraints: BoxConstraints(
                  minWidth: screenSize.width,
                  maxWidth: screenSize.width,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                items: [
                  for (var link in linkList)
                    PopupMenuItem(
                      child: Center(
                        child: Link(
                          hyperLink: link.copyWith(
                            highlightedColor: CustomColors.primaryCyan,
                            textColor: Colors.white,
                            fontStyle: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  const PopupMenuItem(
                    child: Divider(
                      color: Color.fromARGB(135, 85, 83, 83),
                      indent: 20,
                      endIndent: 20,
                      thickness: 2,
                    ),
                  ),
                  PopupMenuItem(
                    child: Center(
                      child: Link(
                        hyperLink: HyperLink(
                          displayText: "Login",
                          url: "",
                          highlightedColor: CustomColors.primaryCyan,
                          textColor: Colors.white,
                          fontStyle: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Center(
                        child: Container(
                          width: double.infinity,
                          child: Button(
                            displayText: "Sign Up",
                            radius: Radius.circular(50),
                            onPressed: () {},
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]);
          },
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
