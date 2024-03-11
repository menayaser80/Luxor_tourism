import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:vixor_project/models/viewed_places.dart';


class ViewedProdProvider with ChangeNotifier {
  final Map<String, ViewedProdModel> _viewedProdItems = {};

  Map<String, ViewedProdModel> get getViewedProds {
    return _viewedProdItems;
  }

  void addViewedProd({required String productId}) {
    _viewedProdItems.putIfAbsent(
      productId,
          () => ViewedProdModel(
          viewedProdId: const Uuid().v4(), productId: productId),
    );

    notifyListeners();
  }
  void clearHistory() {
    _viewedProdItems.clear();
    notifyListeners();
  }
}