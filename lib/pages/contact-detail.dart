import 'package:contact/model/contact.dart';
import 'package:contact/provider/contact-provider.dart';
import 'package:contact/provider/favorite-provider.dart';
import 'package:contact/style/app-style.dart';
import 'package:contact/utils/date-format.dart';
import 'package:contact/widgets/custom-iconbutton.dart';
import 'package:contact/widgets/favorite-widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetail extends StatefulWidget {
  static final routeName = "contactDetail";
  final favorites = new FavoriteProvider();
    updateFavorite(Contact contact, bool isFavorite) {
      if (isFavorite) {
        favorites.addFavorite(contact);
      } else {
        favorites.removeFavorite(contact);
      }
    }
  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  final image =
      "https://i.pinimg.com/originals/f4/1d/0f/f41d0f487dcf832d484c8198be38586c.jpg";

  @override
  Widget build(BuildContext context) {
    final contactId = ModalRoute.of(context).settings.arguments;
    final provider = ContactProvider.of(context);
    final contact = provider.getContacts(contactId);
    

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
                MyFavoriteWidget(
                  isFavorite: widget.favorites.isFavorite(contact),
                  onFavoriteChanged: (isFavorite) {
                    widget.updateFavorite(contact, isFavorite);
                    print(widget.favorites.isFavorite(contact));

                    print(contact.name);
                    print(isFavorite);
                  },
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
                                icon: Icons.phone_enabled_outlined,
                                color: Colors.green,
                                onPressed: () {_makingPhoneCall(contact.phone);},
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              MyIconButton(
                                icon: Icons.messenger_outline,
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
                                icon: Icons.email_outlined,
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
                                icon: Icons.calendar_today,
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
_makingPhoneCall(String number) async { 
  var url = "tel:$number"; 
  launch(url);
}
  List<Widget> iconButton(BuildContext context, Contact contact) {
    return [
      Container(
        decoration:
            BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
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
        decoration:
            BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
        child: IconButton(
          icon: Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ];
  }

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

  // Widget favoriteIcon(BuildContext context, Contact contact) {
  //   final provider = FavoriteProvider.of(context);
  //   bool alreadySaved = provider.isFavorite(contact);
  //   print(alreadySaved);
  //   return Container(
  //     decoration: BoxDecoration(color: Colors.black12, shape: BoxShape.circle),
  //     child: IconButton(
  //       icon: Icon(
  //         alreadySaved ? Icons.favorite : Icons.favorite_border,
  //         color: alreadySaved ? Colors.pink : Colors.white,
  //         size: 30.0,
  //       ),
  //       onPressed: () {
  //         setState(() {
  //           if (alreadySaved) {
  //             provider.removeFavorite(contact);
  //           } else
  //             provider.addFavorite(contact);
  //         });
  //       },
  //     ),
  //   );
  // }
}
