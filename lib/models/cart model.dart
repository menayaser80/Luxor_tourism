import 'package:flutter/material.dart';

class TripModel with ChangeNotifier {
  final String cartId;
  final String productId;
  final int quantity;

  TripModel({
    required this.cartId,
    required this.productId,
    required this.quantity,
  });
}