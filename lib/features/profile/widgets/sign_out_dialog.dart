import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 50.w, // Adjust width as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.close, color: Colors.red, size: 20,),
                      Text("No", style: TextStyle(fontSize: 12, color: Colors.red)),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10), // Adjust spacing between buttons
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
                child: Container(
                  width: 50.w, // Adjust width as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.check, color: Colors.white, size: 20,),
                      Text("Yes", style: TextStyle(fontSize: 12, color: Colors.white)),
                    ],
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ],
      );

    },
  );
}
