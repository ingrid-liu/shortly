import 'package:flutter/material.dart';
import 'package:shortly/widget/bottom_navigation.dart';
import 'package:shortly/widget/shortener.dart';
import 'package:shortly/widget/top_navigation.dart';
import 'package:shortly/widget/welcome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              const Column(
                children: [
                  Shortener(),
                  SizedBox(height: 100),
                ],
              ),
            ],
          ),
          const BottomNav(),
        ],
      ),
    ));
  }
}
