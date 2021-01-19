import 'package:contact/model/contact.dart';

class FavoriteProvider {
  final List<Contact> favorites = [];

  void addFavorite(Contact contact) {
    favorites.add(contact);
  }

  void removeFavorite(Contact contact) {
    favorites.remove(contact);
  }

  Contact getFavoriteContacts(int id) {
    return favorites.firstWhere((c) => c.id == id);
  }

  bool isFavorite(Contact contact) {
    return favorites.contains(contact);
  }
}
