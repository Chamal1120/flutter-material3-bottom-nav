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
          Text(
            'With GetX',
            style: TextStyle(
              color: flavor.green,
              fontSize: 15.0,
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
            This is using the same material3 NavigationBar but navigation is handled by the GetX state mmanagement library (package). GetX abstracts a lot cumbersome tasks in setate and provide a clean and concise code. GetX also helps to reduce the number of stateful widgets as state mmanagement was handled seperately using it's own method which will save a lot of RAM from the running device.
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
            text: "More info at: https://chornthorn.github.io/getx-docs/",
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
