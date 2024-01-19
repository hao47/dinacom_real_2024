import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
   List<int> _words = [];

  List<int> get words => _words;

  void toggleFavorite(int word) {
    final isExist = _words.contains(word);

    if (isExist) {
      _words.remove(word);
    } else {
      _words.add(word);
    }
    notifyListeners();
  }

  bool isExist(int word){
    final isExist  = _words.contains(word);
    return isExist;
  }

  void resetFavorite(int word) {
    _words = [];
    notifyListeners();
  }
}
