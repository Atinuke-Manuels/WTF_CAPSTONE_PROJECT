


import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: false,
        child: SafeArea(
          child: Column(
            children: [
              Text("Home")
            ],
          ),
        ),
      ),
    );
  }
}
