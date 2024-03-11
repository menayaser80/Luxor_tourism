import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:vixor_project/componenet/widgets/empty_bag.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/trip%20provider.dart';
import 'package:vixor_project/provider/wishlist_provider.dart';
import 'package:vixor_project/screens/auth/loading%20manager.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/Trip/bottom_checkout.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/Trip/trip_widget.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';
import 'package:vixor_project/services/chatservices/assets_manager.dart';
class TripScreen extends StatefulWidget {
  const TripScreen({super.key});
  @override
  State<TripScreen> createState() => _TripScreenState();
}

class _TripScreenState extends State<TripScreen> {
  var days=['Two days','Three days',"Four days"];
  var fe = 'Two days';
  String?selecteditem;
  bool _isLoading = false;
  bool isLoadingProd = true;
  Future<void> fetchFCT() async {
    final productsProvider =
    Provider.of<HomeProvider>(context, listen: false);
    final cartProvider = Provider.of<TripProvider>(context);
    final wishlistsProvider =
    Provider.of<WishlistProvider>(context, listen: false);
    try {
      Future.wait({
        productsProvider.fetchProducts(),
        wishlistsProvider.fetchWishlist(),
        cartProvider.fetchCart(),
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
    // final productsProvider = Provider.of<ProductsProvider>(context);
    final productsProvider =
    Provider.of<HomeProvider>(context, listen: false);
    final cartProvider = Provider.of<TripProvider>(context);
    return cartProvider.getCartitems.isEmpty
        ? Scaffold(
      body: EmptyBagWidget(
        imagePath: AssetsManager.banner1,
        title: "Your trip is empty",
        subtitle:
        "Looks like your cart is empty add something and make me happy",
        buttonText: "Choose your trip now now",
      ),
    )
        : Scaffold(
      bottomSheet: CartBottomSheetWidget(function: () async {
        await placeOrderAdvanced(
          cartProvider: cartProvider,
          productProvider: productsProvider,

        );
      }),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsManager.shoppingCart,
          ),
        ),
        title: TitlesTextWidget(
            label: "My trip (${cartProvider.getCartitems.length})"),
        actions: [
          IconButton(
            onPressed: () {
              MyAppFunctions.showErrorOrWarningDialog(
                isError: false,
                context: context,
                subtitle: "Clear Trip?",
                fct: () async {
                  cartProvider.clearCartFromFirebase();
                  // cartProvider.clearLocalCart();
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

      body: LoadingManager(
        isLoading: _isLoading,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Days of trip:",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),)),
                ),
                Container(
                  height: 40.0,
                  width: 140.0,
                  color: Colors.white,
                  child: DropdownButton<String>(
                    items: days.map((String item) {
                      return DropdownMenuItem<String>(
                        onTap: (){
                          setState(() {
                            selecteditem=item;
                          });
                        },
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? thelang) {
                      setState(() {
                        fe = thelang!;
                      });
                    },
                    value: fe,
                  ),
                ),

              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cartProvider.getCartitems.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                        value: cartProvider.getCartitems.values
                            .toList()[index],
                        child: const TripoWidget());
                  }),
            ),
            const SizedBox(
              height: kBottomNavigationBarHeight + 10,
            )
          ],
        ),
      ),
    );
  }

  Future<void> placeOrderAdvanced({
    required TripProvider cartProvider,
    required HomeProvider productProvider,
  }) async {
    try {
      setState(() {
        _isLoading = true;
      });
    cartProvider.getCartitems.forEach((key, value) async {
        final getCurrProduct = productProvider.findByProdId(value.productId);
        final orderId = const Uuid().v4();
        await FirebaseFirestore.instance
            .collection("My Trip")
            .doc(orderId)
            .set({
          'orderId': orderId,
          'PlaceId': value.productId,
          "PlaceTitle": getCurrProduct!.PlaceTitle,
          "PlaceDescription": getCurrProduct.PlaceDescription,
          "PlaceCategory": getCurrProduct.PlaceCategory,
          "PlaceAddress": getCurrProduct.PlaceAddress,
          'TicketforStudent': double.parse(getCurrProduct.TicketforStudent) ,
          'Ticketforadult': double.parse(getCurrProduct.Ticketforadult) ,
          'imageUrl': getCurrProduct.PlaceImage,
          'Days of trip:':selecteditem,
          'orderDate': Timestamp.now(),
        });
      });
      await cartProvider.clearCartFromFirebase();
      cartProvider.clearLocalCart();
    } catch (e) {
      await MyAppFunctions.showErrorOrWarningDialog(
        context: context,
        subtitle: e.toString(),
        fct: () {},
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}