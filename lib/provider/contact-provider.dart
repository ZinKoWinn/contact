import 'package:contact/model/contact.dart';
import 'package:flutter/material.dart';

class ContactProvider extends InheritedWidget {
  final Key key;
  final List<Contact> contacts;
  final Widget child;


  ContactProvider({
    this.key,
    @required this.contacts,
    @required this.child,
  }) : super(
          key: key,
          child: child,
        );

  static ContactProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ContactProvider>();
  }

  Contact getContacts(int id) {
    return contacts.firstWhere((c) => c.id == id);
  }

 

  bool deleteContact(int id) {
    contacts.removeWhere((c) => c.id == id);
    return true;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
