import 'package:flutter/material.dart';
import 'package:shortly/widget/advertise.dart';
import 'package:shortly/widget/boost.dart';
import 'package:shortly/widget/bottom_navigation.dart';
import 'package:shortly/widget/shortener.dart';
import 'package:shortly/widget/top_navigation.dart';
import 'package:shortly/widget/welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    const EdgeInsets desktopPadding = EdgeInsets.symmetric(
      vertical: 30.0,
      horizontal: 170.0,
    );
    const EdgeInsets mobilePadding = EdgeInsets.symmetric(
      vertical: 30.0,
      horizontal: 20.0,
    );
    bool mobileView = screenSize.width < 1050;
    EdgeInsets padding = mobileView ? mobilePadding : desktopPadding;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: padding,
                child: Column(
                  children: [
                    TopNav(mobileView: mobileView),
                  ],
                ),
              ),
              Welcome(mobileView: mobileView),
              Stack(
                children: [
                  Positioned.fill(
                    top: 130,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 237, 236, 239),
                      ),
                    ),
                  ),
                  Container(
                    margin: padding,
                    child: Column(
                      children: [
                        Shortener(mobileView: mobileView),
                        SizedBox(height: 100),
                        Advertise(mobileView: mobileView),
                        SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
              Boost(mobileView: mobileView),
              BottomNav(mobileView: mobileView)
            ]),
      ),
    );
  }
}
