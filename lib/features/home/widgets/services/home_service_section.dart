

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import 'home_service_item.dart';

class HomeServiceSection extends StatelessWidget {
  const HomeServiceSection({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeServiceItem(
            titleText: "Washing & ironing",
            subText: "3 days",
            serviceImage: Image.asset(
              Assets.home.serviceImages.serviceImg1.path,
              height: 40,
              width: double.infinity,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeServiceItem(
            titleText: "Ironing",
            subText: "1 day",
            serviceImage: Image.asset(
              Assets.home.serviceImages.serviceImg2.path,
              height: 40,
              width: double.infinity,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeServiceItem(
            titleText: "Washing",
            subText: "1 day",
            serviceImage: Image.asset(
              Assets.home.serviceImages.serviceIg3.path,
              height: 40,
              width: double.infinity,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          HomeServiceItem(
            titleText: "Dry Cleaning",
            subText: "1 day",
            serviceImage: Image.asset(
              Assets.home.serviceImages.serviceImg4.path,
              height: 40,
              width: double.infinity,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8,),
          HomeServiceItem(
            titleText: "Stain Removal",
            subText: "2 days",
            serviceImage: Image.asset(
              Assets.home.serviceImages.serviceImg5.path,
              height: 40,
              width: double.infinity,
            ),
            onPress: (){},
          ),
          SizedBox(width: 8),
          // HomeServiceItem(
          //   titleText: "Ironing",
          //   subText: "1 day",
          //   serviceImage: Image.asset(
          //     Assets.home.serviceImages.serviceImg1.path,
          //     height: 40,
          //     width: double.infinity,
          //   ),
          //   onPress: (){},
          // ),
          // SizedBox(width: 8),
          // HomeServiceItem(
          //   titleText: "Washing",
          //   subText: "1 day",
          //   serviceImage: Image.asset(
          //     Assets.home.serviceImages.serviceImg2.path,
          //     height: 40,
          //     width: double.infinity,
          //   ),
          //   onPress: (){},
          // ),
          // SizedBox(width: 8),
          // HomeServiceItem(
          //   titleText: "Dry Cleaning",
          //   subText: "1 day",
          //   serviceImage: Image.asset(
          //     Assets.home.serviceImages.serviceIg3.path,
          //     height: 40,
          //     width: double.infinity,
          //   ),
          //   onPress: (){},
          // ),
        ],
      ),
    );
  }
}

