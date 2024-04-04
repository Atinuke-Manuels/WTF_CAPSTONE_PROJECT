import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:laundry_ease/gen/assets.gen.dart';

import '../../../global/common/usermodel.dart';
import '../widgets/sign_out_dialog.dart';
import '../../registration/signup/widgets/signup_authentication.dart';
import '../widgets/profile_item.dart';
import 'dart:io';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SignUpAuthentication _auth =
  SignUpAuthentication(); // Instance of SignUpAuthentication
  String? firstname;
  String? avatar;

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
      UserModel? currentUser = await _auth.readData(email);

      // Update the firstname variable if the current user is found
      if (currentUser != null) {
        setState(() {
          firstname = currentUser.firstname;
          avatar = currentUser.avatarUrl;
        });
        // Debug print to check avatar URL after updating state
        // print('Avatar URL: $avatar');
        // print('Avatar URL: $firstname');
      }
    }
  }

  Future<void> _updateProfileImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      print('Image picked');
      String uid = FirebaseAuth.instance.currentUser!.uid;
      String email = FirebaseAuth.instance.currentUser!.email!;
      Reference ref = FirebaseStorage.instance.ref().child('avatars/$email/avatar.jpg');
      UploadTask uploadTask = ref.putFile(File(pickedFile.path));

      try {
        await uploadTask;
        print('Image uploaded');
        String imageUrl = await ref.getDownloadURL();
        print('Image URL: $imageUrl');

        // Save image URL to Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(email) // Use the user's email as the document ID
            .update({'avatarUrl': imageUrl});

        setState(() {
          avatar = imageUrl;
        });

        // Fetch user data again to update the profile page
        _fetchUserData();
      } on FirebaseException catch (e) {
        if (e.code == 'storage/object-not-found') {
          print('File not found');
        } else if (e.code == 'storage/unauthorized') {
          print('User doesn\'t have permission to access the object');
        } else if (e.code == 'storage/canceled') {
          print('User canceled the upload');
        } else if (e.code == 'storage/unknown') {
          print('Unknown error occurred while uploading the image.');
        } else {
          print('Unknown error occurred, code: ${e.code}');
        }
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/HomePage', // Route name of your home page
                    (route) => false, // This will remove all the routes until the specified route
              );
            },
            child: Icon(Icons.arrow_circle_left_outlined, size: 30,)),
        title: Text("Profile", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
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
                SizedBox(height: 15.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("${firstname ?? "..."}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        GestureDetector(
                            onTap: (){},
                            child: Text("Edit my profile", style: TextStyle(color: Colors.grey.shade400, fontSize: 10),)),
                      ],
                    ),
                    Container(
                      // padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0, // Adjust the width of the border as needed
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
            child: GestureDetector(
              onTap: () {
                      _updateProfileImage();
                      },
              child: avatar != null
                  ? Image.network(
                avatar!,
                height: 60.h,
                width: 60.w,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return CircularProgressIndicator();
                  }
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Icon(Icons.person, size: 40,);
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
                SizedBox(height: 60.h,),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Settings", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.arrowPointer, size: 16,color: Theme.of(context).primaryColorLight,),
                          label: 'Location',
                          onPress: (){},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.handHoldingDollar, size: 16, color: Theme.of(context).primaryColorLight,),
                          label: 'Refer & Earn',
                          onPress: (){},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.creditCard, size: 16, color: Theme.of(context).primaryColorLight,),
                          label: 'Payment Method',
                          onPress: (){},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.bell, size: 16, color: Theme.of(context).primaryColorLight,),
                          label: 'Notification',
                          onPress: (){},
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Support", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.circleQuestion, size: 16,color: Theme.of(context).primaryColorLight,),
                          label: 'Help Center',
                          onPress: (){},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.prescriptionBottle, size: 16, color: Theme.of(context).primaryColorLight,),
                          label: 'How Laundry Ease Works',
                          onPress: (){},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.star, size: 16, color: Theme.of(context).primaryColorLight,),
                          label: 'Review & Rating',
                          onPress: (){},
                        ),
                        ProfileItem(
                          firstIcon: Icon(FontAwesomeIcons.reply, size: 16, color: Theme.of(context).primaryColorLight,),
                          label: 'Give Feedback',
                          onPress: (){},
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          child: InkWell(
                            onTap: (){
                              showSignOutDialog(context);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.exit_to_app, size: 32, color: Colors.red,),
                                SizedBox(width: 10,),
                                Text("Log Out", style: TextStyle(fontSize: 14))
                              ],
                            ),
                          ),
                        )
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
