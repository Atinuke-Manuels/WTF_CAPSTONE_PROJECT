


import 'package:flutter/material.dart';
import 'package:laundry_ease/features/home/widgets/services/see_more_services.dart';

import 'home_service_section.dart';

class Services extends StatelessWidget {
  const Services({
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
                "Services",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SeeMoreServices()));
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
          HomeServiceSection()
        ],
      ),
    );
  }
}


