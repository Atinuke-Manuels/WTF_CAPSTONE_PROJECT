import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  const ButtonItem({
    super.key,
    required this.title,
    required this.onPress,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
  });

  final String title;
  final Function() onPress;
  final Color textColor; // Added parameter for text color with default value
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12),),
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
    );
  }
}
