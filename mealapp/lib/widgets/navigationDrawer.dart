import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget navMenu(String text, IconData icon, var route) {
      return ListTile(
        onTap: () {
          Navigator.pushReplacementNamed(context, route);
        },
        leading: Icon(icon),
        title: Text(text),
      );
    }

    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'KhanPan',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      letterSpacing: 2),
                ),
              ],
            ),
          ),
          navMenu('Home', Icons.home, '/'),
          navMenu('Filter', Icons.format_list_numbered, '/filter')
        ],
      ),
    );
  }
}
