import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../registration/signin/pages/login_page.dart'; // Import your LoginPage file here

Future<void> showSignOutDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        title: Text(
          "Are you sure you want to log out?",
          style: TextStyle(fontSize: 14),
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false,
              );
            },
            child: Text("Yes", style: TextStyle(fontSize: 14)),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.2),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No", style: TextStyle(fontSize: 14)),
          ),
        ],
      );
    },
  );
}
