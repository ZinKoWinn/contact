import 'package:contact/model/contact.dart';
import 'package:contact/style/app-style.dart';
import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final Contact contact;

  const MyCircleAvatar({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return contact.imageUrl.isNotEmpty
        ? CircleAvatar(
            backgroundImage: NetworkImage(contact.imageUrl),
            radius: 30,
          )
        : CircleAvatar(
            child: Text(contact.name.substring(0, 1).toUpperCase(),
                style: boldText.copyWith(fontSize: 30)),
                radius: 30,
          );
  }
}
