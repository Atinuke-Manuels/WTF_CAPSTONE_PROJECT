import 'package:flutter/material.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({
    Key? key,
    required this.title,
    required this.onPress,
    required this.padding,
    this.textColor = Colors.white, // Default text color
    this.backgroundColor = Colors.white, // Default background color
  }) : super(key: key);

  final String title;
  final Function() onPress;
  final EdgeInsetsGeometry padding;
  final Color textColor; // Added parameter for text color with default value
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
      ),
    );
  }
}
