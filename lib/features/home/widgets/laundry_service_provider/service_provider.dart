


import 'package:flutter/material.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/see_more_providers.dart';
import 'package:laundry_ease/features/home/widgets/laundry_service_provider/service_provider_section.dart';


class LaundryServiceProvider extends StatelessWidget {
  const LaundryServiceProvider({
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
                "Laundry Service Providers",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeeMoreProviders()));
                },
                child: Text(
                  "See more",
                  style: TextStyle(
                      fontSize: 12, color: Theme.of(context).primaryColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 5,),
          ServiceProviderSection()
        ],
      ),
    );
  }
}




