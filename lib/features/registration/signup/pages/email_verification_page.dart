// Import necessary packages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';
import 'package:laundry_ease/features/registration/signin/pages/login_page.dart';
import 'package:laundry_ease/global/common/toast.dart';

class EmailVerificationPage extends StatefulWidget {
  final String email;

  const EmailVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  _EmailVerificationPageState createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Email"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail, size: 300.w, color: Theme.of(context).primaryColor,),
              Text(
                "A verification mail has been sent to",
                style: TextStyle(fontSize: 16.0),
              ),Text(
                "${widget.email}",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
              ),

              SizedBox(height: 40.0.h),
              ButtonItem(title: "Resend Mail", onPress: (){
                _resendVerificationEmail();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
              backgroundColor: Theme.of(context).primaryColor,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.3.h,)
            ],
          ),
        ),
      ),
    );
  }

  void _resendVerificationEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.sendEmailVerification();
        // Show toast or snackbar indicating email has been resent
        showToast(message: "Verification email resent");
      } catch (e) {
        print("Error resending verification email: $e");
        // Show error message to the user
        showToast(message: "Failed to resend verification email");
      }
    }
  }
}
