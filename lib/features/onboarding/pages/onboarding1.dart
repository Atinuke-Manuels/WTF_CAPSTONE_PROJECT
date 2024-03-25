import 'package:flutter/material.dart';
import 'package:laundry_ease/features/onboarding/pages/onboarding2.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/onboarding_button.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  Assets.onboarding.onboarding1.path,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width * 1,
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(children: [
                    Text(
                      "Washing is really an amazing experience. Come and try our variety of services which include ironing, starching etc.",
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade400),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.24,
                ),
                OnboardingButton(
                    title: "Next",
                    padding: EdgeInsets.symmetric(horizontal: 48, vertical: 8),
                    onPress: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Onboarding2()),
                            (Route<dynamic> route) => false,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
