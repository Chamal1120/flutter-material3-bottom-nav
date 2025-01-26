import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar/controllers/nav_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_bottom_nav_bar/screens/home.dart';
import 'package:flutter_bottom_nav_bar/screens/about.dart';
import 'package:catppuccin_flutter/catppuccin_flutter.dart';

Flavor flavor = catppuccin.mocha;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Nav',

      // Custom theme data for navigationbar based on state using catppuccin
      theme: ThemeData(
        useMaterial3: true,
        navigationBarTheme: NavigationBarThemeData(
            backgroundColor: flavor.crust,
            indicatorColor: flavor.lavender,
            labelTextStyle: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return TextStyle(color: flavor.subtext1);
                } else {
                  return TextStyle(color: flavor.subtext0);
                }
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return IconThemeData(color: flavor.crust);
                } else {
                  return IconThemeData(color: flavor.subtext1);
                }
              },
            )),
      ),
      home: NavBarM3(),
    );
  }
}

class NavBarM3 extends StatelessWidget {
  NavBarM3({super.key});

  final List<Widget> pages = [HomePage(), AboutPage()];

  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () {
          return NavigationBar(
            onDestinationSelected: (int index) {
              navController.changePage(index);
            },
            destinations: const <Widget>[
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(icon: Icon(Icons.info), label: 'About'),
            ],
            selectedIndex: navController.selectedPage.value,
          );
        },
      ),
      body: Obx(
        () {
          return Padding(
            padding: const EdgeInsets.all(30.0),
            child: pages[navController.selectedPage.value],
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: flavor.crust,
        centerTitle: true,
        title: Text(
          'Bottom Navbar M3',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: flavor.base,
    );
  }
}
