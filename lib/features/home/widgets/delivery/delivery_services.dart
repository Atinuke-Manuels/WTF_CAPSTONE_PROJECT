


import 'package:flutter/material.dart';
import 'package:laundry_ease/features/home/widgets/delivery/home_delivery_service_section.dart';


class DeliveryServices extends StatelessWidget {
  const DeliveryServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Services",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "See more",
                style: TextStyle(
                    fontSize: 12, color: Theme.of(context).primaryColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 5,),
          HomeDeliveryServiceSection()
        ],
      ),
    );
  }
}




