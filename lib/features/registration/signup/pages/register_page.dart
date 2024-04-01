import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../../onboarding/widgets/button_item.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.h,),
                Image.asset(
                  Assets.splash.newLogo.path,
                  height: 332.h,
                  width: 271.w,
                ),
                SizedBox(height: 20,),
                Text(
                  "Sign up as",
                  style: TextStyle(
                      // color: Theme.of(context).primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 38,
                ),
                ButtonItem(
                    title: "A Client",
                    backgroundColor: Theme.of(context).primaryColor,
                    onPress: () {Navigator.pushNamed(context, "/SignUpPage");}),
                SizedBox(height: 24,),
                ButtonItem(
                    title: "A Delivery Agent",
                    textColor: Theme.of(context).primaryColor,
                    onPress: () {Navigator.pushNamed(context, "/SignUpPage");}),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style:
                    TextStyle(fontSize: 18.sp, color: Colors.grey.shade800),
                      textAlign: TextAlign.center,),
                    SizedBox(width: 8,),
                    InkWell(onTap: (){ Navigator.pushNamed(context, "/LoginPage");}, child: Text("Sign in", style:
                    TextStyle(fontSize: 18.sp, color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,),),
                  ],),
                SizedBox(height: 100,),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
