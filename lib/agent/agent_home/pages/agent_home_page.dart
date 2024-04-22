import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laundry_ease/features/profile/widgets/sign_out_dialog.dart';

import '../../../features/home/service_providers/pages/laundry_service_provider_page.dart';
import '../../../features/home/widgets/laundry_service_provider/service_provider_item.dart';
import '../../../features/home/widgets/laundry_service_provider/service_provider_section_item_data.dart';
import '../../../features/registration/signin/pages/login_page.dart';

class AgentHomePage extends StatelessWidget {

  const AgentHomePage({super.key});

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      title: Text("Welcome Agent"),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: (){
                showSignOutDialog(context);
              },
              child: Icon(Icons.exit_to_app)),
        )
      ],
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
