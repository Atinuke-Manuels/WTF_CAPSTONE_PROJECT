import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomeFunctions {
  void shareApkFile(BuildContext context) {
    // Replace 'your_apk_file_link' with the actual shareable link for your APK file
    final String apkFileLink = 'https://drive.google.com/file/d/1y3IUFWCg_lFxEvJzXoseH0iL9ZIX-uFJ/view?usp=sharing';

    try {
      // Share APK file link
      Share.share(apkFileLink, subject: 'Check out this cool Laundry app!');
    } catch (error) {
      // Handle error
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Something went wrong', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            content: Text('Unable to share app link at the moment. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
