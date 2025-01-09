import 'package:amazon_clone/constants/globle_variables.dart';
import 'package:amazon_clone/features/account/screens/account_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBottomWidth = 5;

  List<Widget> pages = [
    const HomeScreen(),
    const AccountScreen(),
    const Center(
      child: Text("Cart page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCartLen =
        Provider.of<UserProvider>(context, listen: false).user.cart.length;
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobleVariables.selectedNavBarColor,
        unselectedItemColor: GlobleVariables.unselectedNavBarColor,
        backgroundColor: GlobleVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // item 1 :  Home Page
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 0
                    ? GlobleVariables.selectedNavBarColor
                    : GlobleVariables.backgroundColor,
                width: bottomBarBottomWidth,
              ))),
              child: const Icon(
                Icons.home_outlined,
              ),
            ),
            label: '',
          ),

          // item 2  : Account

          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 1
                    ? GlobleVariables.selectedNavBarColor
                    : GlobleVariables.backgroundColor,
                width: bottomBarBottomWidth,
              ))),
              child: const Icon(
                Icons.person_outline_outlined,
              ),
            ),
            label: '',
          ),

          // item 3 : cart
          BottomNavigationBarItem(
            icon: Container(
              width: bottomBarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: _page == 2
                    ? GlobleVariables.selectedNavBarColor
                    : GlobleVariables.backgroundColor,
                width: bottomBarBottomWidth,
              ))),
              child: Badge(
                label: Text(userCartLen.toString()),
                backgroundColor: Colors.white,
                textColor: Colors.black,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
