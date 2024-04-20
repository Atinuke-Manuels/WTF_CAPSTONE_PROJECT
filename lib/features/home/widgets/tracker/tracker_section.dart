

import 'package:flutter/material.dart';

class TackerSection extends StatefulWidget {
  const TackerSection({required Key key}) : super(key: key); // Use Key type for key parameter

  @override
  _TackerSectionState createState() => _TackerSectionState();
}

class _TackerSectionState extends State<TackerSection> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tracker",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "See more",
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // Stepper(
          //   type: StepperType.vertical,
          //   steps: getSteps(),
          //   currentStep: currentStep,
          //   physics: AlwaysScrollableScrollPhysics(),
          //   onStepTapped: (step) {
          //     setState(() {
          //       currentStep = step;
          //     });
          //   },
          // )
        ],
      ),
    );
  }

  List<Step> getSteps() => [
    Step(title: Text("Order Confirmed", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Clothes Picked Up", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("In Washing Process", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Drying Stage", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Ironing Stage", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Ready For Delivery", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Out For Delivery", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Delivered", style: TextStyle(fontSize: 8),), content: Container()),
  ];
}