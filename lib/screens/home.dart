import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav_bar/main.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hello from Home Route!',
            style: TextStyle(
              color: flavor.green,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            'How this works?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '''
            This is done using the the NavigationBar flutter widget. It is buit-in to flutter and very easy to use. You just need to pass a List of NavigationDestination widgets to destination property and those will be shown on the screen as navigation menu items. Then you can use a callback function with the onDestinationSelected property to trigger an action when a user taps on a perticular item in a navigation menu item.
          ''',
            textAlign: TextAlign.justify,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13.0,
            ),
          ),
          Linkify(
            onOpen: (link) async {
              if (!await launchUrl(Uri.parse(link.url))) {
                throw Exception('Could not launch ${link.url}');
              }
            },
            text: "More info at: https://api.flutter.dev/flutter/material/NavigationBar-class.html",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
            linkStyle: TextStyle(color: flavor.lavender),
          ),
        ],
      ),
    );
  }
}
