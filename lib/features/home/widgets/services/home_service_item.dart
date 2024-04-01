import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  const HomeServiceItem({
    Key? key,
    required this.serviceImage,
    required this.titleText,
    required this.onPress,
  }) : super(key: key);

  final Widget serviceImage;
  final String titleText;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.20,
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
                SizedBox(height: 12), // Add spacing between the image and text
                Text(
                  titleText,
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
