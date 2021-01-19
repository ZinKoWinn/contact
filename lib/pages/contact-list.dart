import 'package:contact/model/contact.dart';
import 'package:contact/provider/contact-provider.dart';
import 'package:contact/style/app-style.dart';
import 'package:contact/widgets/custom-alertdialog.dart';
import 'package:contact/widgets/custom-circleavatar.dart';
import 'package:flutter/material.dart';

import 'contact-detail.dart';

class ContactList extends StatelessWidget {
  final Contact contact;

  const ContactList({
    Key key,
    this.contact,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = ContactProvider.of(context);
    return Dismissible(
      key: ValueKey(contact.id),
      background: Container(
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Delete",
              style: boldText.copyWith(
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.delete,
              size: 30.0,
              color: Colors.white,
            )
          ],
        ),
      ),
      onDismissed: (d) {},
      direction: DismissDirection.endToStart,
      confirmDismiss: (d) async {
        final result = await MyAlertDialog(
          title: "! Warning !",
          content: "Are you sure? \n You want to delete this contact.",
          defaultAction: "Ok",
          cancelAction: "Cancle",
        ).show(context);

        if (result) {
          final isSuccess = provider.deleteContact(contact.id);
          if (isSuccess) {
            Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.yellow,
              content: Text(
                "Contact Was Successfull deleted",
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 2),
            ));
          }
        }
        return result;
      },
      child: Column(
        children: [
          ListTile(
            leading: MyCircleAvatar(
              contact: contact,
            ),
            title: Text(
              contact.name,
              style: boldText.copyWith(fontSize: 25),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                ContactDetail.routeName,
                arguments: contact.id,
              );
            },
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }
}
