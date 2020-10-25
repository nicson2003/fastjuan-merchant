import 'package:flutter/material.dart';
import 'package:dashboard_reborn/utils/colors.dart';
import 'package:dashboard_reborn/pages/menu_availability.dart';
import 'package:dashboard_reborn/pages/order_processing_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class MyStore extends StatelessWidget {
  final appTitle = 'Merchant App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.brown, // Your app THEME-COLOR
      ),
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialColors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
                padding: const EdgeInsets.all(1.0),
                child: Text('FastJuan Merchant App'))
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(FontAwesome5.store, color: MaterialColors.pink),
              title: Text('New'),
              subtitle: Text('4 items'),
              trailing: Text('7 mins'),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading:
                  Icon(FontAwesome5.handshake, color: MaterialColors.purple),
              title: Text('Accepted'),
              subtitle: Text('7 items'),
              trailing: Text('3 mins'),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading:
                  Icon(FontAwesome5.calendar_check, color: MaterialColors.teal),
              title: Text('Upcoming'),
              subtitle: Text('2 items'),
              trailing: Text('8 mins'),
              isThreeLine: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                FontAwesome5.list_alt,
                color: MaterialColors.yellow,
              ),
              title: Text('History of order'),
              subtitle: Text('100 items'),
              trailing: Text('7 mins'),
              isThreeLine: true,
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Abhishek Mishra"),
              accountEmail: Text("abhishekm977@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: MaterialColors.blue,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              title: Text('Orders Processing'),
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return Orders();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Menu Availability'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) {
                      return MenuPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Recent Orders'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Tutorial'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
