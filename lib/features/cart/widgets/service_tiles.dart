import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceItemTile extends StatefulWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;

  ServiceItemTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);


  @override
  _ServiceItemTileState createState() => _ServiceItemTileState();
}

class _ServiceItemTileState extends State<ServiceItemTile> {
  int itemCount = 1;

  void incrementCounter() {
    setState(() {
      itemCount++;
    });
  }

  void decrementCounter() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).primaryColorLight),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              widget.imagePath,
              height: 30.h,
              width: 30.w,
            ),

            // Text and Button
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName, // Item name text
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Container(
                    width: 100.w,
                    height: 30.h,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: widget.onPressed ?? () {},
                          child: Text(
                            '₦${(int.parse(widget.itemPrice) * itemCount).toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: decrementCounter,
                  icon: Icon(Icons.remove, color: Theme.of(context).primaryColor),
                ),
                Text(
                  itemCount.toString(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: incrementCounter,
                  icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            // Counter
          ],
        ),
      ),
    );
  }
}
