import 'package:flutter/material.dart';
import 'package:share/share.dart';

class HomeFunctions {
  Future<void> shareApkFile(BuildContext context) async {
    try {
      // Provide the static path to the APK file
      final String apkFilePath = 'apk/app-release.apk';

      // Share the APK file
      await Share.shareFiles([apkFilePath], text: 'Check out this app!');
    } catch (e) {
      // Handle errors if any
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to share APK file.'),
      ));
    }
  }
}
