import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laundry_ease/features/registration/signin/pages/login_page.dart';

import '../../../../global/common/toast.dart';
import '../firebase_auth_implementation/firebase_auth_services.dart';
import '../registration/signup/widgets/form_container_widget.dart';


class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isSigning = false;
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text("Login"),
      // ),
      body: Center(
        child: SingleChildScrollView(
          reverse: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Password Reset",
                  style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => _resetPassword(context),
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: isSignReset ? CircularProgressIndicator(
                        color: Colors.white,) : Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                  ),
                ),



                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Remembered your password?", style: TextStyle(fontSize: 18.sp, color: Colors.grey.shade800)),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                              (route) => false,
                        );
                      },
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  bool isSignReset = false;

  void _resetPassword(BuildContext context) async {
    setState(() {
      isSignReset = true; // Set signing state to true
    });

    String email = _emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Navigator.pushNamed(context, '/LoginPage');
      // Show success message to the user
      showToast(message: "Password reset email sent. Please check your email.");
    } catch (e) {
      // Show error message if password reset fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
          Text("Failed to send password reset email. Please try again.",),
        ),
      );
    }
    setState(() {
      isSignReset = false; // Set signing state to true
    });
  }




}


// import 'package:cloud_firestore/cloud_firestore.dart';
//
// void _resetPassword(BuildContext context) async {
//   setState(() {
//     isSignReset = true; // Set signing state to true
//   });
//
//   String email = _emailController.text.trim();
//
//   // Validate email format
//   if (!RegExp(r"^[a-zA-Z0-9+._-]+@[a-zA-Z0-9.-]+$").hasMatch(email)) {
//     showToast(message: "Please enter a valid email address.");
//     setState(() {
//       isSignReset = false; // Reset signing state
//     });
//     return; // Exit the method if email is not valid
//   }
//
//   // Check if the email exists in Firestore (assuming you have a collection of users)
//   bool emailExists = await _checkEmailExists(email);
//
//   if (!emailExists) {
//     showToast(message: "This email is not registered.");
//     setState(() {
//       isSignReset = false; // Reset signing state
//     });
//     return; // Exit the method if email is not registered
//   }
//
//   try {
//     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//     Navigator.pushNamed(context, '/LoginPage');
//     // Show success message to the user
//     showToast(message: "Password reset email sent. Please check your email.");
//   } catch (e) {
//     // Show error message if password reset fails
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content:
//         Text("Failed to send password reset email. Please try again."),
//       ),
//     );
//   }
//   setState(() {
//     isSignReset = false; // Set signing state to false
//   });
// }
//
// Future<bool> _checkEmailExists(String email) async {
//   QuerySnapshot query = await FirebaseFirestore.instance
//       .collection('users') // Change to your collection name
//       .where('email', isEqualTo: email)
//       .limit(1)
//       .get();
//
//   return query.docs.isNotEmpty;
// }
