import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:laundry_ease/global/common/toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../gen/assets.gen.dart';
import '../../../onboarding/widgets/button_item.dart';
import '../../bloc/home_functions.dart';

class LaundryServiceProviderPage extends StatefulWidget {
  final Map<String, dynamic> data;

  const LaundryServiceProviderPage({Key? key, required this.data})
      : super(key: key);

  @override
  _LaundryServiceProviderPageState createState() =>
      _LaundryServiceProviderPageState();
}

class _LaundryServiceProviderPageState
    extends State<LaundryServiceProviderPage> {
  int likeCount = 365; // Initial like count
  int totalReviews = 365; // Initial total reviews count
  bool _showFullAbout = false;
  final HomeFunctions homeFunctions = HomeFunctions();

  // Function to handle thumbs up icon click
  void handleThumbsUpClick() {
    setState(() {
      // Increment like count by 1 when thumbs up is clicked
      likeCount += 1;
      totalReviews += 1;
    });
  }

  // Function to calculate approximate rating
  double calculateApproxRating(int totalReviews) {
    // Assuming each whole number corresponds to a rating increase of 0.1
    double rating = (totalReviews / 100).toDouble();
    return double.parse(rating.toStringAsFixed(1));
  }

  @override
  Widget build(BuildContext context) {
    double approxRating = calculateApproxRating(totalReviews);

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity, // 100% of screen width
              child: Image.asset(
                widget.data['bigImage'],
                // Assuming 'bigImage' contains the asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              onPressed: () {
                // Add functionality for back arrow here
              },
              icon: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 20,
                      ))),
              iconSize: 30,
            ),
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      homeFunctions.shareApkFile(context);
                    },
                    child: Icon(
                      Icons.share,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 15),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      handleThumbsUpClick();
                    },
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Red container
          Positioned(
            top: MediaQuery.of(context).size.height * 0.33,
            // Overlap by 10%
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              // Add your container content here
              child: SingleChildScrollView(
                reverse: false,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Text(
                                "Laundry",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                                size: 20,
                              ),
                              Text("$approxRating ($totalReviews reviews)"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.data['titleText']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: Theme.of(context).primaryColor,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${widget.data['address']}",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          DefaultTabController(
                            length: 4,
                            child: Column(
                              children: [
                                TabBar(
                                  indicatorColor:
                                      Theme.of(context).primaryColor,
                                  labelColor: Theme.of(context).primaryColor,
                                  labelStyle: TextStyle(
                                    fontSize: 10.5.sp,
                                  ),
                                  tabs: [
                                    Tab(text: "About"),
                                    Tab(text: "Services"),
                                    Tab(text: "Gallery"),
                                    Tab(text: "Reviews"),
                                  ],
                                ),
                                SingleChildScrollView(
                                  reverse: false,
                                  child: SizedBox(
                                    height: 300,
                                    child: TabBarView(
                                        physics: NeverScrollableScrollPhysics(),
                                        children: [
                                          SingleChildScrollView(
                                            reverse: false,
                                            child: Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Text(
                                                  "About",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: _showFullAbout
                                                            ? '${widget.data["about"]}'
                                                            : '${widget.data["about"].substring(0, 200)}...',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                      ),
                                                      if (!_showFullAbout)
                                                        WidgetSpan(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                _showFullAbout =
                                                                    true; // Set _showFullAbout to true here
                                                                print(
                                                                    "clicked");
                                                              });
                                                            },
                                                            child: Text(
                                                              ' Read more',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ),
                                                        ),
                                                      if (_showFullAbout)
                                                        WidgetSpan(
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                _showFullAbout =
                                                                    false; // Set _showFullAbout to false here
                                                              });
                                                            },
                                                            child: Text(
                                                              ' See less',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25.h,
                                                ),
                                                Text(
                                                  "Service Provider",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.03.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 60.h,
                                                          width: 60.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  "${widget.data['contactImg1']}"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.05.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${widget.data['contactName1']}",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "Service Provider",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            // Get the current service provider data
                                                            final serviceProvider =
                                                                widget.data;

                                                            // Replace 'contactNum1' or 'contactNum2' with the actual phone number you want to dial
                                                            final phoneNumber =
                                                                serviceProvider[
                                                                        'contactNum1'] ??
                                                                    serviceProvider[
                                                                        'contactNum1'];

                                                            if (await canLaunch(
                                                                'sms:$phoneNumber')) {
                                                              await launch(
                                                                  'sms:$phoneNumber');
                                                            } else {
                                                              showToast(
                                                                  message:
                                                                      'Could not Connect');
                                                            }
                                                          },
                                                          child: Icon(
                                                              Icons.message,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.1),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            // Get the current service provider data
                                                            final serviceProvider =
                                                                widget.data;

                                                            // Replace 'contactNum1' or 'contactNum2' with the actual phone number you want to dial
                                                            final phoneNumber =
                                                                serviceProvider[
                                                                        'contactNum1'] ??
                                                                    serviceProvider[
                                                                        'contactNum1'];

                                                            if (await canLaunch(
                                                                'tel:$phoneNumber')) {
                                                              await launch(
                                                                  'tel:$phoneNumber');
                                                            } else {
                                                              showToast(
                                                                  message:
                                                                      'Could not Connect');
                                                            }
                                                          },
                                                          child: Icon(
                                                              Icons.call,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.05.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          height: 60.h,
                                                          width: 60.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            image:
                                                                DecorationImage(
                                                              image: AssetImage(
                                                                  "${widget.data['contactImg2']}"),
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.05.w,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "${widget.data['contactName2']}",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                            Text(
                                                              "Service Provider",
                                                              style: TextStyle(
                                                                fontSize: 10,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () async {
                                                            // Get the current service provider data
                                                            final serviceProvider =
                                                                widget.data;

                                                            // Replace 'contactNum1' or 'contactNum2' with the actual phone number you want to dial
                                                            final phoneNumber =
                                                                serviceProvider[
                                                                        'contactNum2'] ??
                                                                    serviceProvider[
                                                                        'contactNum2'];

                                                            if (await canLaunch(
                                                                'sms:$phoneNumber')) {
                                                              await launch(
                                                                  'sms:$phoneNumber');
                                                            } else {
                                                              showToast(
                                                                  message:
                                                                      'Could not Connect');
                                                            }
                                                          },
                                                          child: Icon(
                                                              Icons.message,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                        SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.1),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            // Get the current service provider data
                                                            final serviceProvider =
                                                                widget.data;

                                                            // Replace 'contactNum1' or 'contactNum2' with the actual phone number you want to dial
                                                            final phoneNumber =
                                                                serviceProvider[
                                                                        'contactNum2'] ??
                                                                    serviceProvider[
                                                                        'contactNum2'];

                                                            if (await canLaunch(
                                                                'tel:$phoneNumber')) {
                                                              await launch(
                                                                  'tel:$phoneNumber');
                                                            } else {
                                                              showToast(
                                                                  message:
                                                                      'Could not Connect');
                                                            }
                                                          },
                                                          child: Icon(
                                                              Icons.call,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColor),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.03.h,
                                                ),
                                                ButtonItem(
                                                  title: 'Book Service Now',
                                                  onPress: () {
                                                    Navigator.pushNamed(context, '/CartPage');
                                                  },
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColor,
                                                ),
                                              ],
                                            )),
                                          ),
                                          SingleChildScrollView(
                                            reverse: false,
                                            child: Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Text(
                                                  "Laundry Service",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 10.h),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: List.generate(
                                                    (widget.data['laundryService'] as Set<String>).length,
                                                        (index) => Column(
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            // Handle click event here
                                                            print('Clicked');
                                                          },
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                                                              child: Text(
                                                                (widget.data['laundryService'] as Set<String>).toList()[index],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )),
                                          ),
                                          SingleChildScrollView(
                                            reverse: false,
                                            child: Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )),
                                          ),
                                          SingleChildScrollView(
                                            reverse: false,
                                            child: Container(
                                                child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                Text(
                                                  "Review Summary",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            )),
                                          ),
                                        ]),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
