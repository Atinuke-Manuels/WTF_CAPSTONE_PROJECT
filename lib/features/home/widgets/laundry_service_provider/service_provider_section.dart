

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/home/widgets/delivery/home_delivery_service_item.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider_item.dart';

import '../../../../gen/assets.gen.dart';

class ServiceProviderSection extends StatelessWidget {
  const ServiceProviderSection({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 244.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ServiceProviderItem(
            titleText: "Derry Laundry",
            subText: "250 m",
            thirdText: "#600/mth",
            fourthText: "Closed",
            fifthText: "Open 8am Thu",
            serviceImage: Image.asset(
              "assets/home/delivery1.png",
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          ServiceProviderItem(
            titleText: "True Laundry",
            subText: "250 m",
            thirdText: "#400/mth",
            fourthText: "Closed",
            fifthText: "Open 8am Thu",
            serviceImage: Image.asset(
              "assets/home/delivery2.png",
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          ServiceProviderItem(
            titleText: "Delight Laundry",
            subText: "250 m",
            thirdText: "#500/mth",
            fourthText: "Closed",
            fifthText: "Open 8am Thu",
            serviceImage: Image.asset(
              "assets/home/delivery3.png",
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          ServiceProviderItem(
            titleText: "Derry Laundry",
            subText: "250 m",
            thirdText: "#600/mth",
            fourthText: "Closed",
            fifthText: "Open 8am Thu",
            serviceImage: Image.asset(
              "assets/home/delivery1.png",
            ),
            onPress: (){},
          ),
          SizedBox(width: 8,),
          ServiceProviderItem(
            titleText: "Derry Laundry",
            subText: "250 m",
            thirdText: "#600/mth",
            fourthText: "Closed",
            fifthText: "Open 8am Thu",
            serviceImage: Image.asset(
              "assets/home/delivery2.png",
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          ServiceProviderItem(
            titleText: "Derry Laundry",
            subText: "250 m",
            thirdText: "#600/mth",
            fourthText: "Closed",
            fifthText: "Open 8am Thu",
            serviceImage: Image.asset(
              "assets/home/delivery3.png",
            ),
            onPress: (){},
          ),
        ],
      ),
    );
  }
}

