import 'package:contact/model/contact.dart';
import 'package:contact/provider/favorite-provider.dart';
import 'package:contact/style/app-style.dart';
import 'package:contact/widgets/custom-circleavatar.dart';
import 'package:flutter/material.dart';

import 'contact-detail.dart';

class FavoritePage extends StatelessWidget {
  // final List<Contact> contact;

  // const FavoritePage({Key key, this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvioder.of(context);
    final contact = provider.getFavoriteContact;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Favorite Contact"),
      ),
      body: ListView.builder(
          itemCount: contact.length,
          itemBuilder: (c, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: MyCircleAvatar(
                      contact: contact[index],
                    ),
                    title: Text(
                      contact[index].name,
                      style: boldText.copyWith(fontSize: 25),
                    ),
                    onTap: () {
                      print(ContactAPI.getFavoriteContact.length);
                      Navigator.of(context).pushNamed(
                        ContactDetail.routeName,
                        arguments: contact[index].id,
                      );
                    },
                  ),
                ),
                Divider(thickness: 2),
              ],
            );
          }),
    );
  }
}
