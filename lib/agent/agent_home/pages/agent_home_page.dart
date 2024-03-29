import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../features/registration/signin/pages/login_page.dart';

class AgentHomePage extends StatelessWidget {
  const AgentHomePage({super.key});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: Text("Welcome Agent"),
    ),
    body: TextButton(
      onPressed: () {
        _signOut();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
              (route) => false,
        );
      },
      child: Text("Log Out"),
    ),
    );
  }
}
