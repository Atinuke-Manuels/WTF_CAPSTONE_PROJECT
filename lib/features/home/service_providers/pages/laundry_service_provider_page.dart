import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../bloc/home_functions.dart';

class LaundryServiceProviderPage extends StatefulWidget {
  final String titleText;
  final Image serviceImage;
  const LaundryServiceProviderPage({Key? key, required this.titleText, required this.serviceImage}) : super(key: key);

  @override
  _LaundryServiceProviderPageState createState() =>
      _LaundryServiceProviderPageState();
}

class _LaundryServiceProviderPageState
    extends State<LaundryServiceProviderPage> {
  int likeCount = 365; // Initial like count
  int totalReviews = 365; // Initial total reviews count
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
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity, // 100% of screen width
              child: widget.serviceImage,
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
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: 20,))),
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
                    onTap: (){
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
                    onTap: (){
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
            top: MediaQuery.of(context).size.height * 0.47, // Overlap by 10%
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              // Add your container content here
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SingleChildScrollView(
                  reverse: false,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4.0, vertical: 0.0),
                              child: Text(
                                "Laundry",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all<Color?>(
                                Colors.purple.shade200,
                              ),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                  // No border radius
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
                      Text("${widget.titleText}",),
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
