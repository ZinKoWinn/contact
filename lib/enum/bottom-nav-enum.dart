import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BottomNavMenus {
  Contact,
  Favorite,
  Profile,
}

extension BottomNavMenusExtension on BottomNavMenus {
  String get label {
    switch (this) {
      case BottomNavMenus.Contact:
        return "Contact";
        break;
      case BottomNavMenus.Favorite:
        return "Favorite";
        break;
      case BottomNavMenus.Profile:
        return "Profile";
        break;
      default:
        return null;
    }
  }

  IconData get icon {
    switch (this) {
      case BottomNavMenus.Contact:
        return Icons.contact_phone;
        break;
      case BottomNavMenus.Favorite:
        return Icons.favorite;
        break;
      case BottomNavMenus.Profile:
        return Icons.person;
        break;
      default:
        return null;
    }
  }
}
