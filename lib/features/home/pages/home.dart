import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../global/common/usermodel.dart';
import '../../registration/signin/pages/login_page.dart';
import '../../registration/signup/widgets/signup_authentication.dart'; // Import SignUpAuthentication

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SignUpAuthentication _auth = SignUpAuthentication(); // Instance of SignUpAuthentication
  String? firstname;
  String? role;// Variable to store firstname

  @override
  void initState() {
    super.initState();
    _fetchUserData();// Fetch user data when the widget initializes

  }

  void _fetchUserData() async {
    // Retrieve the current user's email from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';
      UserModel? currentUser = await _auth.readData(email);

      // Update the firstname variable if the current user is found
      if (currentUser != null) {
        setState(() {
          firstname = currentUser.firstname;
          role = currentUser.role;
        });
      }
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: false,
        child: SafeArea(
          child: Column(
            children: [
              Text("Hello ${firstname ?? "..."}"),
              Text("I am a  ${role ?? "..."}"),
              TextButton(
                onPressed: () {
                  _signOut();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false,
                  );
                },
                child: Text("Log Out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
