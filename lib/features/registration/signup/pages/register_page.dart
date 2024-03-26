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
                "Sign up as",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 38,
              ),
              ButtonItem(
                  title: "A Client",
                  onPress: () {Navigator.pushNamed(context, "/SignUpPage");}),
              // SizedBox(height: 6,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //   Text("Already have an account?", style:
              //   TextStyle(fontSize: 14, color: Colors.grey.shade400),
              //     textAlign: TextAlign.center,),
              //   SizedBox(width: 8,),
              //   InkWell(onTap: (){}, child: Text("Sign in", style:
              //   TextStyle(fontSize: 14, color: Colors.blue.shade400, fontWeight: FontWeight.bold),
              //     textAlign: TextAlign.center,),),
              // ],),
              SizedBox(height: 24,),
              ButtonItem(
                  title: "An Agent",
                  onPress: () {Navigator.pushNamed(context, "/SignUpPage");}),
              SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style:
                  TextStyle(fontSize: 14, color: Colors.grey.shade400),
                    textAlign: TextAlign.center,),
                  SizedBox(width: 8,),
                  InkWell(onTap: (){ Navigator.pushNamed(context, "/LoginPage");}, child: Text("Sign in", style:
                  TextStyle(fontSize: 14, color: Colors.blue.shade400, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),),
                ],),
              SizedBox(height: 130,),
            ],
          ),
        ),
      ),
    ));
  }
}
