import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeServiceItem extends StatelessWidget {
  const HomeServiceItem({
    Key? key,
    required this.serviceImage,
    required this.titleText,
    required this.onPress,
    required this.subText,
  }) : super(key: key);

  final Widget serviceImage;
  final String titleText;
  final String subText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.32,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2), // Border color
              width: 1, // Border width
            ),
          ),
          child: ListTile(
            onTap: () {},
            contentPadding: EdgeInsets.all(8),
            title: Column(
              children: [
                serviceImage,
                // SizedBox(height: 12), // Add spacing between the image and text
                Text(
                  titleText,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 10),
                  textAlign: TextAlign.center,
                ),
                Text(
                  subText,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 8),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 3.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
