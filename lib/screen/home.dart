import 'package:flutter/material.dart';
import 'package:shortly/widget/top_navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
            top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
        child: const Column(
          // Main content of the homepage goes here
          children: [
            TopNav(),
            Center(
              child: Text('Main Content Here'),
            ),
            Text('Bottom Navigation Bar Placeholder'),
          ],
        ),
      ),
    );
  }
}
