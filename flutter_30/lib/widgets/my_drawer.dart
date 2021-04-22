import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imgURL = "https://avatars.githubusercontent.com/u/38564835?v=4";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imgURL),
              ),
              accountName: Text(
                'Sharjeel Moqrab Khan',
                style: TextStyle(fontSize: 21.0),
              ),
              accountEmail: Text("sharjeelmoqrabkhan@gmail.com"),
            ),
          ),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.person),
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
