import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../onboarding/widgets/button_item.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.splash.laundryEaseLogo.path,
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(height: 60,),
              Text(
                "Sign up as a:",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 38,
              ),
              ButtonItem(
                  title: "Client",
                  onPress: () {}),
              SizedBox(height: 24,),
              ButtonItem(
                  title: "Agent",
                  onPress: () {}),
              SizedBox(height: 130,)
            ],
          ),
        ),
      ),
    ));
  }
}
