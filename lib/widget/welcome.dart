import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 170),
      child: Flex(
        direction: screenSize.width < 800 ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'More than just\nshorter links',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 80,
                        height: 1.1,
                        letterSpacing: -1,
                      ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Build your brand\'s recognition and get detailed\ninsights on how your links are performing.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40),
                const Button(
                  displayText: 'Get Started',
                  radius: Radius.circular(25),
                ),
              ],
            ),
          ),
          ClipRRect(
            child: Align(
              alignment: Alignment.topLeft,
              widthFactor: .75,
              child: SvgPicture.asset(
                'assets/images/illustration-working.svg',
                height: 500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
