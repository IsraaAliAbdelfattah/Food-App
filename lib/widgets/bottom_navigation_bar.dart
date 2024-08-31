import 'dart:async';
import 'package:audio_to_text_app/views/cart_page.dart';
import 'package:audio_to_text_app/views/favourite_view.dart';
import 'package:audio_to_text_app/views/history_view.dart';
import 'package:audio_to_text_app/views/home_view.dart';
import 'package:audio_to_text_app/widgets/no_internet_connection.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});
  static String id = 'Navigation bar';
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentindex = 0;
  bool isconnectedtointernet = true;
  StreamSubscription? _internetConnectionStreamSubscription;
  @override
  void initState() {
    super.initState();
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          setState(() {
            isconnectedtointernet = true;
          });
          break;
        case InternetStatus.disconnected:
          setState(() {
            isconnectedtointernet = false;
          });
          break;
        default:
          setState(() {
            isconnectedtointernet = true;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return isconnectedtointernet == false
        ? Scaffold(
            body: NoInternetConnection(
              onPressed: () {
                _internetConnectionStreamSubscription =
                    InternetConnection().onStatusChange.listen((event) {
                  if (event == InternetStatus.connected) {
                    isconnectedtointernet = true;
                    setState(() {});
                  }
                });
              },
            ),
          )
        : Scaffold(
            body: PageView(
              onPageChanged: (value) {
                setState(() {
                  currentindex = value;
                });
              },
              controller: pageController,
              children: const [
                HomeView(),
                CartPage(),
                FavouriteView(),
                HistoryView(),
              ],
            ),
            bottomNavigationBar: NavigationBar(
              elevation: 1,
              selectedIndex: currentindex,
              onDestinationSelected: (value) {
                setState(() {
                  currentindex = value;
                  pageController.jumpToPage(value);
                });
              },
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: ''),
                NavigationDestination(
                    icon: Icon(Icons.shopping_cart), label: ''),
                NavigationDestination(
                    icon: Icon(Icons.favorite_outline), label: ''),
                NavigationDestination(icon: Icon(Icons.access_time), label: ''),
              ],
            ),
          );
  }
}
