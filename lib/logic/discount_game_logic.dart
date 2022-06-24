import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:game_give_aways/models/discount_game.dart';
import "package:http/http.dart" as http;

enum Status {
  none,
  loading,
  success,
  error,
}

class DiscountGameLogic extends ChangeNotifier {
  List<DiscountGameModel> _discountGameList = [];
  List<DiscountGameModel> get discountGameList => _discountGameList;

  Status _status = Status.none;
  Status get status => _status;

  Future readData() async {
    String url = "https://www.gamerpower.com/api/giveaways";
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<DiscountGameModel> newItems = await compute(_convert, response.body);
      _discountGameList += newItems;
    } else {
      _status = Status.error;
    }
    notifyListeners();
  }

  List<DiscountGameModel> _favoriteList = [];
  List<DiscountGameModel> get favoriteList => _favoriteList;

  void addFavorite(DiscountGameModel item) {
    _favoriteList.add(item);
    notifyListeners();
  }

  void removeFavorite(DiscountGameModel item) {
    _favoriteList.remove(item);
    notifyListeners();
  }

  void clearAllFavorites() {
    _favoriteList.clear();
    notifyListeners();
  }

  bool isFavorite(DiscountGameModel item) {
    return _favoriteList.contains(item);
  }
}

List<DiscountGameModel> _convert(String body) {
  List list = json.decode(body);
  return list.map((e) => DiscountGameModel.fromMap(e)).toList();
}
