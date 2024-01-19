import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/laport.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'item/beranda/beranda.dart';
import 'item/berita/berita.dart';
import 'item/poran/poran.dart';
import 'item/profile/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final poranNavKey = GlobalKey<NavigatorState>();
  final newsNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();
  int selectedTab = 0;
  List<NavModel> items = [];

  @override
  void initState() {
    super.initState();
    items = [
      // NavModel(
      //   page: Beranda(),
      //   navKey: homeNavKey,
      // ),
      NavModel(
        page: Poran(),
        navKey: poranNavKey,
      ),
      // NavModel(
      //   page: Berita(),
      //   navKey: newsNavKey,
      // ),
      NavModel(
        page: Profile(),
        navKey: profileNavKey,
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return Future.value(false);
        } else {
          return Future.value(true);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: selectedTab,
          children: items
              .map((page) => Navigator(
            key: page.navKey,
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => page.page)
              ];
            },
          ))
              .toList(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(

          decoration: BoxDecoration(
            color: ColorValue.secondaryColor,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white.withOpacity(1), width: 4),
          ),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Lapor();
                },
                transitionDuration: Duration(milliseconds: 1000),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  const duration = Duration(milliseconds: 500); // Durasi transisi dalam milidetik, disesuaikan dengan kebutuhan Anda

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ));
            },
            // child: Icon(Icons.add),
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: const Icon(Icons.add,color: Colors.white,size: 40),
          ),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedTab,
          onTap: (index) {
            if (index == selectedTab) {
              items[index]
                  .navKey
                  .currentState
                  ?.popUntil((route) => route.isFirst);
            } else {
              setState(() {
                selectedTab = index;
              });
            }
          },
        ),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final int tab;

  const TabPage({Key? key, required this.tab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

class Page extends StatelessWidget {
  final int tab;

  const Page({super.key, required this.tab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page Tab $tab')),
      body: Center(child: Text('Tab $tab')),
    );
  }
}

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      height: 90,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(
                2.0,
                6.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
          ],
          color: Colors.white,
        ),
        // height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            navItem(
              "",
              Icons.home,
              pageIndex == 0,
              onTap: () => onTap(0),
            ),
            // navItem(
            //   "",
            //   Icons.campaign,
            //   pageIndex == 1,
            //   onTap: () => onTap(1),
            // ),
            const SizedBox(width: 80),
            // navItem(
            //   "",
            //   Icons.newspaper,
            //   pageIndex == 2,
            //   onTap: () => onTap(2),
            // ),
            navItem(
              "",
              Icons.person,
              pageIndex == 1,
              onTap: () => onTap(1),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem(String menu, IconData icon, bool selected,
      {Function()? onTap}) {
    return Expanded(
      child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: selected
                    ? const Color.fromRGBO(0, 128, 255, 1)
                    : Colors.grey.withOpacity(0.8),
              ),
              // Text(menu,
              //     style: TextStyle(
              //       fontSize: 14,
              //       color: selected
              //           ? const Color.fromRGBO(0, 128, 255, 1)
              //           : Colors.grey.withOpacity(0.8),
              //     ))
            ],
          )),
    );
  }
}
class NavModel {
  final Widget page;
  final GlobalKey<NavigatorState> navKey;

  NavModel({required this.page, required this.navKey});
}