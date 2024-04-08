import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/home/service_providers/pages/laundry_service_provider_page.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider_item.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider_section_item_data.dart';


class ServiceProviderSection extends StatelessWidget {
  const ServiceProviderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: serviceProviderData.map((data) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ServiceProviderItem(
              titleText: data['titleText'],
              subText: data['subText'],
              thirdText: data['thirdText'],
              fourthText: data['fourthText'],
              fifthText: data['fifthText'],
              serviceImage: Image.asset(
                data['serviceImage'],
                fit: BoxFit.cover,
              ),
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LaundryServiceProviderPage(
                      titleText: data['titleText'],
                      serviceImage: Image.asset(
                        data['bigImage'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
