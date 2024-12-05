import 'package:flutter/material.dart';

import '../../core/models/court.dart';
import '../../core/shared_preferences/preferences.dart';

class FavoriteProvider with ChangeNotifier {
  bool _isFavorite = false;

  void init(Court selectedCourt) async {
    _isFavorite = !await Preferences.belongToFavorite(selectedCourt);
    notifyListeners();
  }

  bool get isFavorite => _isFavorite;

  set setIsFavorite(bool value) {
    _isFavorite = !isFavorite;
    notifyListeners();
  }
}
