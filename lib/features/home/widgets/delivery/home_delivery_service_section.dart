

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/home/widgets/delivery/home_delivery_service_item.dart';

import '../../../../gen/assets.gen.dart';

class HomeDeliveryServiceSection extends StatelessWidget {
  const HomeDeliveryServiceSection({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeDeliveryServiceItem(
            titleText: "DHL Service Point",
            subText: "32 Awolowo Road Ikoyi Lagos \n106104, Lagos",
            thirdText: "Office Hours: .closed. open 8am Thu",
            serviceImage: Image.asset(
              Assets.home.deliveryImg1.path,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeDeliveryServiceItem(
            titleText: "Karier Express",
            subText: "29 Okonkwo Shimenian Street \nIloko Gbagada, Gbagada Lagos",
            thirdText: "Office Hours: .closed. open 8am Thu",
            serviceImage: Image.asset(
              Assets.home.deliveryImg2.path,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeDeliveryServiceItem(
            titleText: "Qiuickie Delivery",
            subText: "12 Owodunni Street, off Toyin \nstreet, Ikeja Lagos",
            thirdText: "Office Hours: .closed. open 8am Thu",
            serviceImage: Image.asset(
              Assets.home.deliveryImg3.path,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeDeliveryServiceItem(
            titleText: "DHL Service Point",
            subText: "32 Awolowo Road Ikoyi Lagos \n106104, Lagos",
            thirdText: "Office Hours: .closed. open 8am Thu",
            serviceImage: Image.asset(
              Assets.home.deliveryImg1.path,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8,),
          HomeDeliveryServiceItem(
            titleText: "Karier Express",
            subText: "29 Okonkwo Shimenian Street \nIloko Gbagada, Gbagada Lagos",
            thirdText: "Office Hours: .closed. open 8am Thu",
            serviceImage: Image.asset(
              Assets.home.deliveryImg2.path,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeDeliveryServiceItem(
            titleText: "Qiuickie Delivery",
            subText: "12 Owodunni Street, off Toyin \nstreet, Ikeja Lagos",
            thirdText: "Office Hours: .closed. open 8am Thu",
            serviceImage: Image.asset(
              Assets.home.deliveryImg3.path,
            ),
            onPress: (){},
          ),
        ],
      ),
    );
  }
}

