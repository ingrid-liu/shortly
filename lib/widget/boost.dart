import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/global/color.dart';
import 'package:shortly/widget/button.dart';

class Boost extends StatelessWidget {
  final bool mobileView;
  const Boost({super.key, this.mobileView = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: CustomColors.primaryDarkViolet,
          ),
          child: SvgPicture.asset(
            mobileView
                ? 'assets/images/bg-boost-mobile.svg'
                : 'assets/images/bg-boost-desktop.svg',
            fit: BoxFit.cover,
          ),
        ),
        Column(
          children: [
            Text(
              'Boost your links today',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 20),
            const Button(
              displayText: "Get Started",
              radius: Radius.circular(25),
            ),
          ],
        ),
      ],
    );
  }
}
