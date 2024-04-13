import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  // final color;
  void Function()? onPressed;

  ServiceItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    // this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).primaryColorLight),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // item image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.asset(
                imagePath,
                height: 60.h,
                fit: BoxFit.cover,
              ),
            ),

            // item name
            Text(
              itemName,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),

            MaterialButton(
              onPressed: onPressed,
              color: Theme.of(context).primaryColor,
              child: Text(
                '₦' + itemPrice,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}