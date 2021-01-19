import 'package:contact/model/contact.dart';
import 'package:contact/pages/contact-list.dart';
import 'package:contact/provider/contact-provider.dart';
import 'package:contact/widgets/custom-form.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final provider = ContactProvider.of(context);
    final contacts = provider.contacts;
    void addContact(Contact contact) {
      setState(() {
        contacts.add(contact);
      });
    }

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          actions: [
            Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  shape: BoxShape.circle),
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (c) => MyForm(
                          addContact: addContact,
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15.0,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ContactList(
                contact: contacts[index],
              );
            },
            childCount: contacts.length,
          ),
        ),
      ],
    );
  }
}

/*
subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contacts[index].email,
                    style: normalText,
                  ),
                  Text(
                    contacts[index].phone,
                    style: normalText,
                  ),
                ],
              ),
              */
