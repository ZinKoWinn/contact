import 'package:contact/model/contact.dart';
import 'package:contact/pages/contact-detail.dart';
import 'package:contact/provider/contact-provider.dart';
import 'package:contact/provider/favorite-provider.dart';
import 'package:flutter/material.dart';

import 'pages/home-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContactProvider(
      contacts: ContactAPI.getContacts,
      child: FavoriteProvioder(
        contacts: ContactAPI.getFavoriteContact,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            "/": (c) => MyHomePage(title: 'Contact'),
            ContactDetail.routeName: (c) => ContactDetail(),
          },
        ),
      ),
    );
  }
}
