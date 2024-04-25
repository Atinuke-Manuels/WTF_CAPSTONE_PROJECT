import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_ease/features/profile/widgets/refer_and_earn.dart';
import 'package:laundry_ease/gen/assets.gen.dart';
import 'package:laundry_ease/global/common/toast.dart';

import '../../home/pages/home_page.dart';
import '../widgets/sign_out_dialog.dart';
import '../../registration/signup/widgets/signup_authentication.dart';
import '../widgets/profile_item.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SignUpAuthentication _auth = SignUpAuthentication();
  String? firstname;
  String? avatar;
  String? userEmail;
  DocumentSnapshot? snapshot;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }


  void _fetchUserData() async {
    // Retrieve the current user's email from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String email = user.email ?? '';

      // Get Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query Firestore for user data based on email
      QuerySnapshot querySnapshot = await firestore.collection('users')
          .where('email', isEqualTo: email)
          .get();

      // Check if user data is found
      if (querySnapshot.docs.isNotEmpty) {
        // Extract user data
        var userData = querySnapshot.docs.first.data() as Map<String, dynamic>?;

        if (userData != null) {
          setState(() {
            // Update UI with user data
            firstname = userData['firstname'] as String? ?? '';
            avatar = userData['avatarUrl'] as String? ?? '';
            userEmail = userData['email'] as String? ?? '';
          });
        }
      }
    }
  }

  Future<void> _updateProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Image picked');
      String email = FirebaseAuth.instance.currentUser!.email!;
      print('Querying Firestore with email: $email');

      // Reference to the storage location
      Reference ref = FirebaseStorage.instance.ref().child('avatars/$email/avatar.jpg');

      try {
        // Upload the image to Firebase Storage
        UploadTask uploadTask = ref.putFile(File(pickedFile.path));
        TaskSnapshot taskSnapshot = await uploadTask;
        showToast(message: 'Image uploaded');

        // Get the download URL of the uploaded image
        String imageUrl = await taskSnapshot.ref.getDownloadURL();
        // print('Image URL: $imageUrl');

        // Update avatar URL in Firestore
        await FirebaseFirestore.instance.collection('users').doc(email).update({'avatarUrl': imageUrl});
        // print('Avatar URL updated in Firestore');

        // Fetch user data again to update the profile page
        // print('Fetching user data...');

        // Update the avatar variable in the state with the new URL
        setState(() {
          avatar = imageUrl;
        });

        _fetchUserData();
        // print('User data fetched successfully');
      } catch (e) {
        showToast( message: 'Error updating avatar URL: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          child: Icon(Icons.arrow_back, size: 24), // Reduce the size of the icon to fit inside the container
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        reverse: false,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${firstname ?? "..."}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Edit my profile",
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: _updateProfileImage,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: avatar != null
                              ? Image.network(
                            avatar!,
                            height: 60.h,
                            width: 60.w,
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              return loadingProgress == null ? child : CircularProgressIndicator();
                            },
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return Icon(Icons.person, size: 40);
                            },
                          )
                              : Image.asset(
                            Assets.profile.avatar.path,
                            height: 60.h,
                            width: 60.w,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 60.h),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Settings",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.arrowPointer,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Location',
                          onPress: () {},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.handHoldingDollar,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Refer & Earn',
                          onPress: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> ReferAndEarnPage()));
                          },
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.creditCard,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Payment Method',
                          onPress: () {},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.bell,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Notification',
                          onPress: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Support",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.circleQuestion,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Help Center',
                          onPress: () {},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.prescriptionBottle,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'How Laundry Ease Works',
                          onPress: () {},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.star,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Review & Rating',
                          onPress: () {},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.reply,
                              size: 16,
                              color: Theme.of(context).primaryColorLight),
                          label: 'Give Feedback',
                          onPress: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 16),
                          child: InkWell(
                            onTap: () {
                              showSignOutDialog(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app, size: 32, color: Colors.red),
                                SizedBox(width: 10),
                                Text("Log Out", style: TextStyle(fontSize: 14)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
