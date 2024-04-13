import 'package:flutter/material.dart';
import 'package:laundry_ease/features/cart/widgets/service_tiles.dart';


class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
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
    return Scaffold(
      body: ServiceItemTile(
        itemName: "Your Item Name",
        itemPrice: "Your Item Price",
        imagePath: "Your Image Path",
        onPressed: () {
          // Add your onPressed logic here
        },
        itemCount: itemCount,
        incrementCounter: incrementCounter,
        decrementCounter: decrementCounter,
      ),
    );
  }
}
