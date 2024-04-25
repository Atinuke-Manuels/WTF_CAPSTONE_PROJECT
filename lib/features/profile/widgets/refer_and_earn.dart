import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laundry_ease/features/onboarding/widgets/button_item.dart';

class ReferAndEarnPage extends StatelessWidget {
  const ReferAndEarnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.54.h,
                width: double.infinity,
                child: Image.asset("assets/profile/referAndEarn.png"),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Refer a friend and Earn",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: Text(
                    "For every referral you earn a 15% discount on your next booking",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.purple, // Border color
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Dzwekyrz",
                          style: TextStyle(color: Colors.black), // Text color
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 50.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Theme.of(context).primaryColor,
                          border: Border.all(
                            color: Colors.purple, // Border color
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Copy",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 34, vertical: 20),
                  child: ButtonItem(
                    title: "Refer a friend",
                    onPress: () {},
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  "Also share referral code",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/profile/watsapp.png',
                          width: 40,
                          height: 40,
                        )),
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/profile/fbook.png',
                          width: 40,
                          height: 40,
                        )),
                    InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/profile/msg.png',
                          width: 40,
                          height: 40,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
