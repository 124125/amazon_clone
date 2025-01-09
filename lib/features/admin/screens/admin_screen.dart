import 'package:amazon_clone/constants/globle_variables.dart';
import 'package:amazon_clone/features/admin/screens/posts_screen.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomBarWidth = 42;
  double bottomBarBottomWidth = 5;

  List<Widget> pages = [
    const PostsScreen(),
    const Center(
      child: Text("Analytics page"),
    ),
    const Center(
      child: Text("Orders page"),
    ),
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobleVariables.appBarGradient),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/amazon_in.png',
                      width: 120,
                      height: 45,
                      color: Colors.black,
                    ),
                  ),
                  const Text(
                    "admin",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ]),
          )),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobleVariables.selectedNavBarColor,
        unselectedItemColor: GlobleVariables.unselectedNavBarColor,
        backgroundColor: GlobleVariables.backgroundColor,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // item 1 :  posts
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

          // item 2  : Analytics

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
                Icons.analytics_outlined,
              ),
            ),
            label: '',
          ),

          // item 2  : Orders

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
              child: const Icon(
                Icons.all_inbox_outlined,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
