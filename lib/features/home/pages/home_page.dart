import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laundry_ease/features/cart/pages/cart_page.dart';
import 'package:laundry_ease/features/chat/pages/chat_page.dart';
import 'package:laundry_ease/features/home/pages/placeholder.dart';
import 'package:laundry_ease/features/profile/pages/profile_page.dart';
import '../bloc/home_cubit.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listOfPages = [
    Home(),
    ProfilePage(),
    CartPage(),
    ChatPage()
  ];

  var selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    HomeBloc homeBloc = context.watch<HomeBloc>();
    HomeState homeState = homeBloc.state;
    var selectedIndex = homeState.tabIndex;

    return Scaffold(
      body: IndexedStack(     // indexedStack helps to avoid rebuilding the UI over and over again. It builds it just once.
        children: listOfPages,
        index: selectedIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            homeBloc.updateTabIndex(value);
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_circle_outlined),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: ""),
        ],
      ),
    );
  }
}
