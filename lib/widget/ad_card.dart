import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shortly/global/color.dart';

class AdCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String description;
  final bool mobileView;

  const AdCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.mobileView = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 40,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 330,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: mobileView
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: CustomColors.primaryDarkViolet,
                  child: SizedBox(
                    child: SvgPicture.asset(
                      iconPath,
                      width: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: CustomColors.neutralVeryDarkViolet,
                      ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
