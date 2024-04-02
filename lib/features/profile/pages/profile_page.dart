import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/gen/assets.gen.dart';

import '../../../global/common/usermodel.dart';
import '../../registration/signin/pages/login_page.dart';
import '../../registration/signup/widgets/signup_authentication.dart';
import '../widgets/profile_item.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  SignUpAuthentication _auth =
  SignUpAuthentication(); // Instance of SignUpAuthentication
  String? firstname;

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
          child: Container(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h,),
                Text("Profile", style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 30.h,),
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
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0, // Adjust the width of the border as needed
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          Assets.profile.avatar.path,
                          height: 40.h,
                          width: 40.w,
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
                              _signOut();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                    (route) => false,
                              );
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

