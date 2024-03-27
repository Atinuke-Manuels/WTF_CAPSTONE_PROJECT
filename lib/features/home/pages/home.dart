import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../registration/signin/pages/login_page.dart';
import '../../registration/signup/widgets/signup_authentication.dart'; // Import SignUpAuthentication

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SignUpAuthentication _auth = SignUpAuthentication(); // Instance of SignUpAuthentication

  String? firstname; // Variable to store firstname

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data when the widget initializes
  }

  void _fetchUserData() async {
    // Retrieve the current user's email from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';
      List<UserModel> users = await _auth.readData().first;
      UserModel? currentUser;

      // Find the user with the matching email
      for (UserModel user in users) {
        if (user.email == email) {
          currentUser = user;
          break;
        }
      }

      // Update the firstname variable if the current user is found
      if (currentUser != null) {
        setState(() {
          firstname = currentUser?.firstname;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: false,
        child: SafeArea(
          child: Column(
            children: [
              Text("Hello ${firstname ?? "..."}"), // Display the firstname
              TextButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
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
