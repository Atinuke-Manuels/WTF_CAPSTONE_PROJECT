import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider_item.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider_section_item_data.dart';

import '../../service_providers/pages/laundry_service_provider_page.dart';

class SeeMoreProviders extends StatelessWidget {
  const SeeMoreProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laundry Service", style: TextStyle(color: Theme.of(context).primaryColor),),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            scrollDirection: Axis.vertical,
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
                            data: data
                        ),
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
