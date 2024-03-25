import 'package:flutter/material.dart';
import 'package:laundry_ease/features/registration/signup/pages/register_page.dart';
import '../../../gen/assets.gen.dart';
import '../widgets/onboarding_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  Future<void> _onGetStartedPressed(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingComplete', true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
          (Route<dynamic> route) => false,
    );
  }

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
                  Assets.onboarding.onboarding3.path,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OnboardingButton(
                        title: "Previous",
                        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 8),
                        onPress: () {Navigator.pushNamed(context, '/Onboarding2');}),
                    OnboardingButton(
                        title: "Get Started",
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                        onPress: () {
                          _onGetStartedPressed(context);
                        }),
                  ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}