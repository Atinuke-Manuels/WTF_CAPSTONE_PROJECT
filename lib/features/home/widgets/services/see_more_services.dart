

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import 'home_service_item.dart';

class SeeMoreServices extends StatelessWidget {
  const SeeMoreServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Services", style: TextStyle(color: Theme.of(context).primaryColor),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2, // Set the number of items per row
            crossAxisSpacing: 10.0, // Set the spacing between columns
            mainAxisSpacing: 10.0, // Set the spacing between rows
            children: [
              Container(
                height: 250.h,
                child: HomeServiceItem(
                  titleText: "Washing & ironing",
                  subText: "3 days",
                  serviceImage: Image.asset(
                    Assets.home.serviceImages.serviceImg1.path,
                    height: 40,
                    width: double.infinity,
                  ),
                  onPress: (){},
                ),
              ),
              Container(
                height: 250.h,
                child: HomeServiceItem(
                  titleText: "Ironing",
                  subText: "1 day",
                  serviceImage: Image.asset(
                    Assets.home.serviceImages.serviceImg2.path,
                    height: 40,
                    width: double.infinity,
                  ),
                  onPress: (){},
                ),
              ),
              Container(
                height: 250.h,
                child: HomeServiceItem(
                  titleText: "Washing",
                  subText: "1 day",
                  serviceImage: Image.asset(
                    Assets.home.serviceImages.serviceIg3.path,
                    height: 40,
                    width: double.infinity,
                  ),
                  onPress: (){},
                ),
              ),
              Container(
                height: 250.h,
                child: HomeServiceItem(
                  titleText: "Dry Cleaning",
                  subText: "1 day",
                  serviceImage: Image.asset(
                    Assets.home.serviceImages.serviceImg4.path,
                    height: 40,
                    width: double.infinity,
                  ),
                  onPress: (){},
                ),
              ),
              Container(
                height: 250.h,
                child: HomeServiceItem(
                  titleText: "Stain Removal",
                  subText: "2 days",
                  serviceImage: Image.asset(
                    Assets.home.serviceImages.serviceImg5.path,
                    height: 40,
                    width: double.infinity,
                  ),
                  onPress: (){},
                ),
              ),
              // Add more HomeServiceItem widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
