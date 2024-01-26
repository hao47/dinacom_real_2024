import 'package:dinacom_2024/UI/bottom_navigation/item/berita/berita.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/lapor/laport.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/poran/poran.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/profile/profile.dart';
import 'package:dinacom_2024/UI/bottom_navigation/item/search/search_page.dart';
import 'package:dinacom_2024/common/theme/color_value.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final int currentIndex;

  const BottomNavigation({Key? key, this.currentIndex = 0}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List _pageStack = [];

  int getCurrentIndex() {
    return _currentIndex;
  }

  final _tabs = [
    Poran(),
    SearchPage(),
    // Lapor(),
    Container(),
    Berita(),
    Profile(),
  ];

  void _pagePush(int i) {
    if (_pageStack.isEmpty) {
      _pageStack.add(_currentIndex);
    }
    if (i == _currentIndex) {
      return;
    }
    if (!_pageStack.contains(_currentIndex)) {
      _pageStack.add(_currentIndex);
    }

    setState(() {
      _currentIndex = i;
    });
  }

  Future<bool> _pagePop(BuildContext context) {
    if (_pageStack.isEmpty) {
      return Future<bool>.value(true);
    } else {
      int t = _pageStack.removeLast();
      setState(() {
        _currentIndex = (_currentIndex != t) ? t : _pageStack.removeLast();
      });
      return Future<bool>.value(false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () => _pagePop(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(
                Icons.home_rounded,
                color: ColorValue.primaryColor,
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              activeIcon: Icon(
                Icons.search_rounded,
                color: ColorValue.primaryColor,
              ),
              label: 'Pencarian',
            ),
            BottomNavigationBarItem(
              icon: const SizedBox.shrink(),
              label: "",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.add),
            //   activeIcon: Icon(
            //     Icons.add,
            //     color: ColorValue.primaryColor,
            //   ),
            //   label: 'lapor',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.campaign_outlined, size: 26),
              activeIcon: Icon(
                Icons.campaign_rounded,
                color: ColorValue.primaryColor,
                size: 26,
              ),
              label: 'Informasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(
                Icons.person,
                color: ColorValue.primaryColor,
              ),
              label: 'Profil',
            ),
          ],
          currentIndex: _currentIndex,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorValue.primaryColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: textTheme.bodyText2,
          unselectedLabelStyle: textTheme.bodyText2,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 5,
          onTap: (index) {
            // print(index);
            if (index == 2) {
              _pagePush(_currentIndex);
            } else {
              _pagePush(index);
            }
          },
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
              FocusManager.instance.primaryFocus?.unfocus();
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return Lapor();
                },
                transitionDuration: Duration(milliseconds: 1000),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;
                  const duration = Duration(
                      milliseconds:
                          500); // Durasi transisi dalam milidetik, disesuaikan dengan kebutuhan Anda

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
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
            child: const Icon(Icons.add, color: Colors.white, size: 40),
          ),
        ),
      ),
    );
  }
}
