


import 'package:flutter/material.dart';

class TackerSection extends StatelessWidget {
  const TackerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Tracker",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "See more",
            style: TextStyle(
                fontSize: 12, color: Theme.of(context).primaryColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ],);
  }
}
