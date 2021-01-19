import 'package:contact/enum/bottom-nav-enum.dart';
import 'package:contact/pages/contact-page.dart';
import 'package:contact/pages/favorite-page.dart';
import 'package:contact/pages/profile-page.dart';
import 'package:contact/provider/contact-provider.dart';
import 'package:contact/widgets/custom-form.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  final pages = <Widget>[
    ContactPage(),
    FavoritePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: BottomNavMenus.values
            .map(
              (e) => BottomNavigationBarItem(
                icon: Icon(e.icon),
                label: e.label,
              ),
            )
            .toList(),
      ),
    );
  }
}

/*
appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) => MyForm(
                  addContact:addContact,
                ),
              ),
            ),
          ),
        ],
      ),
      */
