import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar/views/home.dart';
import 'package:flutter_bottom_nav_bar/views/about.dart';
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
          )
        ),
      ),
      home: NavBarM3(),
    );
  }
}

class NavBarM3 extends StatefulWidget {
  const NavBarM3({super.key});

  @override
  State<NavBarM3> createState() => _NavBarM3State();
}

class _NavBarM3State extends State<NavBarM3> {
  int currentPageIndex = 0;
  List<Widget> pages = [HomePage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(
            () {
              currentPageIndex = index;
            },
          );
        },
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.info), label: 'About'),
        ],
        selectedIndex: currentPageIndex,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: pages[currentPageIndex],
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
