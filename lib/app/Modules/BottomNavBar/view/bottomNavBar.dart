import 'package:bro_app/app/Modules/Cart/cart_screen.dart';
import 'package:bro_app/app/Modules/Home/home_screen.dart';
import 'package:bro_app/app/Modules/Orders/order_screen.dart';
import 'package:bro_app/app/Modules/Profile/view/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex=0;
   List navPages=[
     HomeScreen(),
     OrderScreen(),
     CartScreen(),
     ProfileScreen()
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (index){
          setState(() {
            currentIndex=index;
          });
          },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.grey,
       items: [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "Order"),
         BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
       ],
      ),
    );
  }
}
