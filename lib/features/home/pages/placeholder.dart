import 'package:flutter/material.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Holder"),
      ),
      body: SingleChildScrollView(
          reverse: false, child: SafeArea(child: Text("Place Holder"))),
    );
  }
}
