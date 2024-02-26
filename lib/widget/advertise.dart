import 'package:flutter/material.dart';
import 'package:shortly/widget/ad_card.dart';
import 'package:shortly/global/color.dart';

class Advertise extends StatelessWidget {
  final bool mobileView;
  const Advertise({super.key, this.mobileView = false});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Text(
          'Advanced Statistics',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: screenSize.width * .8,
          child: Text(
            'Track how your links are performing across the web with our advanced statistics dashboard.',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: CustomColors.neutralGrayishViolet),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Stack(
          children: [
            Positioned.fill(
              top: mobileView ? 220 : 260,
              bottom: mobileView ? 220 : 190,
              left: mobileView ? 160 : 0,
              right: mobileView ? 160 : 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: CustomColors.primaryCyan,
                ),
              ),
            ),
            Flex(
              direction: mobileView ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdCard(
                  iconPath: 'assets/images/icon-brand-recognition.svg',
                  title: 'Brand Recognition',
                  description:
                      'Boost your brand recognition with each click. Generic links don\'t mean a thing. Branded links help instil confidence in your content.',
                  mobileView: mobileView,
                ),
                Padding(
                  padding: EdgeInsets.only(top: mobileView ? 40 : 80),
                  child: AdCard(
                    iconPath: 'assets/images/icon-detailed-records.svg',
                    title: 'Detailed Records',
                    description:
                        'Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.',
                    mobileView: mobileView,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: mobileView ? 40 : 160),
                  child: AdCard(
                    iconPath: 'assets/images/icon-fully-customizable.svg',
                    title: 'Fully Customizable',
                    description:
                        'Improve brand awareness and content discoverability. Customize and brand your links to promote your brand.',
                    mobileView: mobileView,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
