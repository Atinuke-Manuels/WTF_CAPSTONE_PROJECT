import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceProviderItem extends StatelessWidget {
  const ServiceProviderItem({
    Key? key,
    required this.serviceImage,
    required this.titleText,
    required this.subText,
    required this.onPress,
    required this.thirdText,
    required this.fourthText,
    required this.fifthText,
  }) : super(key: key);

  final Widget serviceImage;
  final String titleText;
  final String subText;
  final String thirdText;
  final String fourthText;
  final String fifthText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.36,
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.withOpacity(0.2), // Border color
            width: 1, // Border width
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              height: 100,
              width: double.infinity.w,
              child: serviceImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(children: [
                      Icon(FontAwesomeIcons.locationDot, color: Colors.black, size: 12,),
                      SizedBox(width: 5.w,),
                      Text(subText, style: TextStyle(fontSize: 8),),
                    ],),
                    Text(thirdText, style: TextStyle(fontSize: 8),)
                  ],),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(children: [
                      Icon(FontAwesomeIcons.clock, color: Colors.black, size: 12,),
                      SizedBox(width: 5.w,),
                      Text(fourthText, style: TextStyle(fontSize: 8),),
                    ],),
                    Text(fifthText, style: TextStyle(fontSize: 8),)
                  ],),
                  GestureDetector(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.12,
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF6647A4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text("See details", style: TextStyle(color: Colors.white, fontSize: 5)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
