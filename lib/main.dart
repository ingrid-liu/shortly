import 'package:flutter/material.dart';
import 'package:shortly/global/color.dart';

import 'screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shortly',
        home: HomePage(),
        theme: ThemeData(
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            bodySmall: TextStyle(
              fontSize: 18.0,
              color: CustomColors.neutralGray,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
            bodyMedium: TextStyle(
                fontSize: 22.0,
                color: CustomColors.neutralGrayishViolet,
                fontWeight: FontWeight.w700),
            bodyLarge: TextStyle(
                fontSize: 40.0,
                color: CustomColors.neutralVeryDarkViolet,
                fontWeight: FontWeight.w700),
          ),
        ));
  }
}
