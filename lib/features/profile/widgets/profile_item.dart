

import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.firstIcon,
    required this.label,
    required this.onPress,
  });

  final Widget firstIcon;
  final String label;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0, // Adjust the width of the border as needed
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
              child: ListTile(
                leading: firstIcon, // Leading icon
                title: Text(label, style: TextStyle(fontSize: 14),), // Text in between
                trailing: InkWell(
                    onTap: onPress,
                    child: Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).primaryColorLight,)), // Trailing icon
              ),
            ),
          ),
        ),
      ],
    );
  }
}

