import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/features/home/widgets/delivery/delivery_services.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider.dart';
import 'package:laundry_ease/features/profile/pages/profile_page.dart';

import '../../../gen/assets.gen.dart';
import '../../../global/common/usermodel.dart';
import '../../registration/signin/pages/login_page.dart';
import '../../registration/signup/widgets/signup_authentication.dart';
import '../widgets/services/services.dart';
import '../widgets/tracker/tracker_section.dart'; // Import SignUpAuthentication

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SignUpAuthentication _auth =
      SignUpAuthentication(); // Instance of SignUpAuthentication
  String? firstname;
  String? address; // Variable to store firstname

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
          address = currentUser.address;
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
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hello ${firstname ?? "..."}",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4.w,
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.locationDot,
                            color: Colors.black,
                          ),
                          SizedBox(width: 6.w,),
                          Expanded(
                            child: Text(
                              "${address ?? "..."}",
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 12,
                              ),
                              maxLines: 2,
                              // Set the maximum number of lines to 1
                              overflow: TextOverflow
                                  .ellipsis, // Handle overflow with ellipsis
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                          }, child: Icon(Icons.settings)),
                          InkWell(
                              onTap: () {},
                              child: Icon(
                                FontAwesomeIcons.solidBell,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.2), // Border color
                          width: 1,
                        ), // Adjust the color as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 100.h,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF6647A4),
                        Color(0xFFAE93E5).withOpacity(0.2)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 150.w,
                          child: Text("Your clothes will be ready in 1 day.", style: TextStyle(fontSize: 12),)),
                      Image.asset(
                        Assets.home.washingMachine1.path,
                        height: 90,
                        width: 70,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Services(),
                SizedBox(height: 20,),
                LaundryServiceProvider(),
                SizedBox(height: 20,),
                // DeliveryServices()
                TackerSection(
                  key: GlobalKey(), // You can use GlobalKey or any other appropriate key
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
    Step(title: Text("Order Confirmed", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Clothes Picked Up", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("In Washing Process", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Drying Stage", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Ironing Stage", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Ready For Delivery", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Out For Delivery", style: TextStyle(fontSize: 8),), content: Container()),
    Step(title: Text("Delivered", style: TextStyle(fontSize: 8),), content: Container()),
  ];
}

