import 'package:flutter/material.dart';
import 'package:vixor_project/models/catmodel.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';

class AppConstants {
  static const String imageUrl =
      'https://i.ibb.co/8r1Ny2n/20-Nike-Air-Force-1-07.png';

  static List<String> categoriesList = [
    'Nile Tourism ',
    'Historical landmarks (west)',
    'Historical landmarks (East)',
    'leisure tourism',
    'Religious tourism',
  ];
  static List<CategoriesModel> categoyList = [
    CategoriesModel(
      id: "Nile Tourism",
      image: AssetsManager.nile,
      name: "Nile Tourism",
    ),
    CategoriesModel(
      id: "Historical landmarks (west)",
      image: AssetsManager.west,
      name: "Historical landmarks (west)",
    ),
    CategoriesModel(
      id: "Historical landmarks (East)",
      image: AssetsManager.east,
      name: "Historical landmarks (East)",
    ),
    CategoriesModel(
      id: "leisure tourism",
      image: AssetsManager.leusrios,
      name: "leisure tourism",
    ),
    CategoriesModel(
      id: "Religious tourism",
      image: AssetsManager.religious,
      name: "Religious tourism",
    ),

  ];
  static List<String> bannersImages = [
    AssetsManager.banner1,
    AssetsManager.banner2,
    AssetsManager.banner3,
  ];
  static List<DropdownMenuItem<String>>? get categoriesDropDownList {
    List<DropdownMenuItem<String>>? menuItem =
    List<DropdownMenuItem<String>>.generate(
      categoriesList.length,
          (index) => DropdownMenuItem(
        value: categoriesList[index],
        child: Text(categoriesList[index]),
      ),
    );
    return menuItem;
  }
}