import 'package:contact/provider/contact-provider.dart';
import 'package:contact/provider/favorite-provider.dart';
import 'package:contact/style/app-style.dart';
import 'package:contact/utils/date-format.dart';
import 'package:contact/widgets/custom-iconbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactDetail extends StatelessWidget {
  static final routeName = "contactDetail";

  final image =
      "https://i.pinimg.com/originals/f4/1d/0f/f41d0f487dcf832d484c8198be38586c.jpg";

  @override
  Widget build(BuildContext context) {
    final contactId = ModalRoute.of(context).settings.arguments;
    final provider = ContactProvider.of(context);
    final contact = provider.getContacts(contactId);
    final favoriteProvider = FavoriteProvioder.of(context);
    final isFavorite = favoriteProvider.isFavorite(contact);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              pinned: false,
              snap: true,
              actions: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12, shape: BoxShape.circle),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12, shape: BoxShape.circle),
                  child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.pink : Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        isFavorite
                            ? favoriteProvider.removeFavorite(contact)
                            : favoriteProvider.addToFavorite(contact);
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      contact.imageUrl.isNotEmpty ? contact.imageUrl : image),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Hero(
                    tag: contact.name,
                    child: Column(
                      children: [
                        info(
                          context,
                          label: "Name",
                          data: contact.name,
                        ),
                        info(
                          context,
                          label: "Phone",
                          data: contact.phone,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyIconButton(
                                icon: Feather.phone_call,
                                color: Colors.green,
                                onPressed: () async {
                                  FlutterPhoneDirectCaller.callNumber(
                                      contact.phone);
                                },
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              MyIconButton(
                                icon: Feather.message_square,
                                color: Colors.amber,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        info(
                          context,
                          label: "Email",
                          data: contact.email,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyIconButton(
                                icon: Feather.mail,
                                color: Colors.amber,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        info(
                          context,
                          label: "Birthday",
                          data: dateFormat(contact.dateofbirth),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyIconButton(
                                icon: Icons.cake,
                                color: Colors.amber,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _makingPhoneCall(String number) async {
  //   var url = "tel:$number";
  //   launch(url);
  // }

  Widget info(
    BuildContext context, {
    String label,
    String data,
    Widget child,
  }) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label),
              SizedBox(
                height: 10,
              ),
              Text(
                data,
                style: boldText,
              ),
            ],
          ),
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}
