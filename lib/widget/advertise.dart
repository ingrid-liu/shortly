import 'package:flutter/material.dart';
import 'package:shortly/widget/ad_card.dart';
import 'package:shortly/global/color.dart';

class Advertise extends StatelessWidget {
  const Advertise({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 170),
      child: Column(
        children: [
          Text(
            'Advanced Statistics',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: screenSize.width * .4,
            child: Text(
              'Track how your links are performing across the web with our advanced statistics dashboard.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: CustomColors.neutralGrayishViolet, height: 2),
              textAlign: TextAlign.center,
            ),
          ),
          Stack(
            children: [
              Positioned.fill(
                top: 260,
                bottom: 190,
                child: Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.primaryCyan,
                  ),
                ),
              ),
              Flex(
                direction:
                    screenSize.width < 800 ? Axis.vertical : Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AdCard(
                    iconPath: 'assets/images/icon-brand-recognition.svg',
                    title: 'Brand Recognition',
                    description:
                        'Boost your brand recognition with each click. Generic links don\'t mean a thing. Branded links help instil confidence in your content.',
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 80),
                    child: AdCard(
                      iconPath: 'assets/images/icon-detailed-records.svg',
                      title: 'Detailed Records',
                      description:
                          'Gain insights into who is clicking your links. Knowing when and where people engage with your content helps inform better decisions.',
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 160),
                    child: AdCard(
                      iconPath: 'assets/images/icon-fully-customizable.svg',
                      title: 'Fully Customizable',
                      description:
                          'Improve brand awareness and content discoverability. Customize and brand your links to promote your brand.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
