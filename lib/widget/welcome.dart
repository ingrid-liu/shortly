import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'button.dart';

class Welcome extends StatelessWidget {
  final bool mobileView;
  const Welcome({super.key, this.mobileView = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: mobileView ? 20 : 170),
      child: Flex(
        direction: mobileView ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: mobileView
            ? [
                _welcomeImage(),
                SizedBox(height: 40),
                _welcomeText(context),
              ]
            : [
                _welcomeText(context),
                _welcomeImage(),
              ],
      ),
    );
  }

  Widget _welcomeText(context) {
    return Column(
      crossAxisAlignment:
          mobileView ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'More than just\nshorter links',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 80,
                height: 1.1,
                letterSpacing: -1,
              ),
          textAlign: mobileView ? TextAlign.center : null,
        ),
        const SizedBox(height: 16),
        Text(
          'Build your brand\'s recognition and get detailed\ninsights on how your links are performing.',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.w500),
          textAlign: mobileView ? TextAlign.center : null,
        ),
        const SizedBox(height: 40),
        Center(
          widthFactor: mobileView ? null : 1,
          child: const Button(
            displayText: 'Get Started',
            radius: Radius.circular(25),
          ),
        ),
      ],
    );
  }

  Widget _welcomeImage() {
    return Align(
      alignment: Alignment.topLeft,
      widthFactor: .70,
      child: SvgPicture.asset(
        'assets/images/illustration-working.svg',
        height: 500,
      ),
    );
  }
}
