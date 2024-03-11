import 'dart:developer';

import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/empty_bag.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/wishlist_provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/placewidget2.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';


class WishlistScreen extends StatefulWidget {
  static const routName = "/WishlistScreen";
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final bool isEmpty = true;
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final productsProvider =
    Provider.of<HomeProvider>(context, listen: false);
    final wishlistsProvider =
    Provider.of<WishlistProvider>(context, listen: false);
    try {
      Future.wait({
        productsProvider.fetchProducts(),
        wishlistsProvider.fetchWishlist(),
      });

    } catch (error) {
      log(error.toString());
    }
  }
  @override
  void didChangeDependencies() {
    if (isLoadingProd) {
      fetchFCT();
    }
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return wishlistProvider.getWishlists.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.bagWish,
        title: "Nothing in ur wishlist yet",
        subtitle:
        "Looks like your cart is empty add something and make me happy",
        buttonText: "Prefer Place Now",
      ),
    )
        : Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.hors,
          ),
        ),
        title: TitlesTextWidget(
            label: "Favourite Places(${wishlistProvider.getWishlists.length})"),
        actions: [
          IconButton(
            onPressed: () {
              MyAppFunctions.showErrorOrWarningDialog(
                isError: false,
                context: context,
                subtitle: "Clear Wishlist?",
                fct: () async {
                  await wishlistProvider.clearWishlistFromFirebase();
                  wishlistProvider.clearLocalWishlist();
                },
              );
            },
            icon: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: DynamicHeightGridView(
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        builder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlaceWidget2(
              productId: wishlistProvider.getWishlists.values
                  .toList()[index]
                  .productId,
            ),
          );
        },
        itemCount: wishlistProvider.getWishlists.length,
        crossAxisCount: 2,
      ),
    );
  }
}