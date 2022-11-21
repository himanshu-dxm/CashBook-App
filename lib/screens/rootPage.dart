import 'package:expenses_record/screens/addTransaction.dart';
import 'package:expenses_record/screens/profilePage.dart';
import 'package:expenses_record/screens/statsPage.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../utils/Utilities.dart';
import 'budgetPage.dart';
import 'daily_page.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyPage(),
    StatsPage(),
    BudgetPage(),
    ProfilePage(),
    AddTransactionPage(),
    // CreatBudgetPage()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              // print("+ tapped");
              // selectedTab(4);
              Navigator.push(context, MaterialPageRoute(builder: (_)=>AddTransactionPage()));
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
            backgroundColor: Colors.pink
          //params
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.calendar_today,
      Icons.query_stats,
      Icons.wallet,
      Icons.account_box
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }

}