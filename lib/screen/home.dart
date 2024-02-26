import 'package:flutter/material.dart';
import 'package:shortly/widget/bottom_navigation.dart';
import 'package:shortly/widget/top_navigation.dart';
import 'package:shortly/widget/welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 170.0),
            child: const Column(
              children: [
                TopNav(),
              ],
            ),
          ),
          const Welcome(),
          const BottomNav(),
        ],
      ),
    );
  }
}
