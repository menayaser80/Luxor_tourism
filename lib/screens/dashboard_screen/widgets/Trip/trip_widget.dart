import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/models/cart%20model.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/trip%20provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/heartbtn.dart';


class TripoWidget extends StatelessWidget {
  const TripoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartModel = Provider.of<TripModel>(context);
    final productsProvider = Provider.of<HomeProvider>(context);
    final getCurrProduct = productsProvider.findByProdId(cartModel.productId);
    final cartProvider = Provider.of<TripProvider>(context);
    return getCurrProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: FancyShimmerImage(
                  imageUrl: getCurrProduct.PlaceImage,
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.6,
                          child: TitlesTextWidget(
                            label: getCurrProduct.PlaceTitle,
                            maxLines: 2,
                          ),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () async {
                                cartProvider.removeCartItemFromFirestore(
                                  cartId: cartModel.cartId,
                                  productId: getCurrProduct.PlaceId,
                                  qty: cartModel.quantity,
                                );
                                // cartProvider.removeOneItem(
                                //   productId: getCurrProduct.productId,
                                // );
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            HeartButtonWidget(
                              productId: getCurrProduct.PlaceId,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SubtitleTextWidget(
                          label: "Category:${getCurrProduct.PlaceCategory}",
                          color: Colors.black,
                        ),
                        SubtitleTextWidget(
                          label: "Address:${getCurrProduct.PlaceAddress}",
                          color: Colors.black,
                        ),
                        SubtitleTextWidget(
                          label: "Ticketforadult:${getCurrProduct.Ticketforadult}\$",
                          color: Colors.blue,
                        ),
                        SubtitleTextWidget(
                          label: "TicketforStudent:${getCurrProduct.TicketforStudent}\$",
                          color: Colors.blue,
                        ),


                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}