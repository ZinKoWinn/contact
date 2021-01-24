class Contact {
  int id;
  String name;
  String phone;
  String email;
  DateTime dateofbirth;
  String imageUrl;

  Contact({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.dateofbirth,
    this.imageUrl = "",
  });
}

class ContactAPI {
  static List<Contact> getContacts = [
    Contact(
      id: 1,
      name: "Zin Ko Winn",
      phone: "09797256920",
      email: "zinko.developer@gmail.com",
      dateofbirth: DateTime.now(),
      imageUrl:
          "https://scontent.frgn13-1.fna.fbcdn.net/v/t1.0-9/83732684_493792534894088_391212598009266176_o.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=iA4xu-nEwd8AX_ar9tH&_nc_ht=scontent.frgn13-1.fna&oh=7fe2ea4c2df1e43df05845337b3c508f&oe=602A410B",
    ),
    Contact(
      id: 2,
      name: "Khin Suu Suu Nwe",
      phone: "09797256920",
      email: "khinsuusuunwe@gmail.com",
      dateofbirth: DateTime.now(),
      imageUrl:
          "https://scontent.frgn13-1.fna.fbcdn.net/v/t1.0-1/c0.0.320.320a/p320x320/82173183_113083480227903_4456489213432430592_n.jpg?_nc_cat=105&ccb=2&_nc_sid=7206a8&_nc_ohc=zT0ZItFUkvsAX9N56n2&_nc_oc=AQkjWiQ5OmbA7iRQg2QS4ayvtO0kK2yOX08koX5kqGL5mn2-NFCY4spYv66Ed0Pg7Go&_nc_ht=scontent.frgn13-1.fna&tp=27&oh=bfeae7551b803e2ad1eac62ee04b3a4e&oe=602A9760",
    ),
    Contact(
      id: 3,
      name: "Shan Lay",
      phone: "09797256920",
      email: "shanlay@gmail.com",
      dateofbirth: DateTime.now(),
    ),
  ];

  static List<Contact> getFavoriteContact = [];
}

typedef AddContact = void Function(Contact);
typedef DeleteContact = bool Function(String);
