import 'package:contact/model/contact.dart';
import 'package:flutter/cupertino.dart';

class FavoriteProvioder extends StatefulWidget {
  final List<Contact> contacts;
  final Widget child;

  const FavoriteProvioder({Key key, this.contacts, this.child})
      : super(key: key);

  static _FavoriteProvioderState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_FavoriteProvided>().data;
  }

  @override
  _FavoriteProvioderState createState() => _FavoriteProvioderState();
}

class _FavoriteProvioderState extends State<FavoriteProvioder> {
  @override
  Widget build(BuildContext context) {
    return _FavoriteProvided(
      child: widget.child,
      data: this,
    );
  }

  void addToFavorite(Contact contact) {
    setState(() {
      widget.contacts.add(contact);
    });
  }

  void removeFavorite(Contact contact) {
    setState(() {
      widget.contacts.remove(contact);
    });
  }

  bool isFavorite(Contact contact) {
    if (widget.contacts.contains(contact))
      return true;
    else
      return false;
  }

  List<Contact> get getFavoriteContact {
    return widget.contacts;
  }
}

class _FavoriteProvided extends InheritedWidget {
  final _FavoriteProvioderState data;

  _FavoriteProvided({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
