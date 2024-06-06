import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:eclarios/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../cart/cart_screen.dart';
import '../home/home_screen.dart';
import '../menu/menu_screen.dart';
import '../mylist/mylist_screen.dart';
import '../search/search_screen.dart';

class BottomBarPage extends StatefulWidget {
  final Map<String, dynamic>? data;
  final int initialPage;
  const BottomBarPage({super.key, this.initialPage = 2, this.data});

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  late PageController _pageController;

  final _controller = NotchBottomBarController(index: 2);

  int maxCount = 5;
  List<Widget> bottomBarPages = [];

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.initialPage);
    bottomBarPages = [
      HomeScreen(),
      SearchScreen(),
      MyListScreen(),
      CartScreen(
        name: widget.data?['name'],
        subname: widget.data?['subname'],
        description: widget.data?['description'],
        url: widget.data?['url'],
        price: widget.data?['price'],
      ),
      MenuScreen()
    ];

    _controller.index = widget.initialPage;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? Container(
              child: AnimatedNotchBottomBar(
                // bottomBarHeight: mq.height * 0.062,
                bottomBarWidth: mq.width * 1,
                showTopRadius: true,
                topMargin: mq.height * 0.015,
                removeMargins: true,
                itemLabelStyle: TextStyle(
                    color: kBottomBarTextColor,
                    fontSize: mq.width * 0.025,
                    fontWeight: FontWeight.w500),
                durationInMilliSeconds: 300,
                notchBottomBarController: _controller,
                color: kBottomBarColor,
                showLabel: true,
                notchColor: kTextColor,
                bottomBarItems: [
                  BottomBarItem(
                      inActiveItem: Image.asset(
                        'assets/images/Home-removebg-preview.png',
                      ),
                      activeItem: Image.asset(
                        'assets/images/Home-removebg-preview.png',
                        color: kPrimaryColor,
                      ),
                      itemLabel: 'Home'),
                  BottomBarItem(
                      inActiveItem: Image.asset(
                        'assets/images/search-removebg-preview.png',
                      ),
                      activeItem: Image.asset(
                        'assets/images/search-removebg-preview.png',
                        color: kPrimaryColor,
                      ),
                      itemLabel: 'Search'),
                  BottomBarItem(
                      inActiveItem: Image.asset(
                        'assets/images/list.png',
                        color: kTextColor1,
                      ),
                      activeItem: Image.asset(
                        'assets/images/list.png',
                        color: kPrimaryColor,
                      ),
                      itemLabel: 'MyList'),
                  BottomBarItem(
                      inActiveItem: Image.asset(
                        'assets/images/cart-removebg-preview.png',
                      ),
                      activeItem: Image.asset(
                        'assets/images/cart-removebg-preview.png',
                        color: kPrimaryColor,
                      ),
                      itemLabel: 'Cart'),
                  BottomBarItem(
                      inActiveItem: Image.asset(
                        'assets/images/menu.png',
                      ),
                      activeItem: Image.asset(
                        'assets/images/menu.png',
                        color: kPrimaryColor,
                      ),
                      itemLabel: 'Profile'),
                ],
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                kIconSize: mq.width * 0.05,
                kBottomRadius: 0,
              ),
            )
          : null,
    );
  }
}
