import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vixor_project/componenet/widgets/subtitle_text.dart';
import 'package:vixor_project/componenet/widgets/title%20widget.dart';
import 'package:vixor_project/provider/homeprovider.dart';
import 'package:vixor_project/provider/trip%20provider.dart';
import 'package:vixor_project/provider/view%20provider.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/heartbtn.dart';
import 'package:vixor_project/screens/dashboard_screen/widgets/product_details.dart';
import 'package:vixor_project/services/MyAppFunctions.dart';


class PlaceWidget2 extends StatefulWidget {
  const PlaceWidget2({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  State<PlaceWidget2> createState() => _PlaceWidget2State();
}

class _PlaceWidget2State extends State<PlaceWidget2> {
  @override
  Widget build(BuildContext context) {
    // final productModelProvider = Provider.of<ProductModel>(context);
    final productsProvider = Provider.of<HomeProvider>(context);
    final getCurrProduct = productsProvider.findByProdId(widget.productId);
    Size size = MediaQuery.of(context).size;
    final viewedProdProvider = Provider.of<ViewedProdProvider>(context);
    final cartProvider = Provider.of<TripProvider>(context);

    return getCurrProduct == null
        ? const SizedBox.shrink()
        : Padding(
      padding: const EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () async {
          viewedProdProvider.addViewedProd(
              productId: getCurrProduct.PlaceId);
          await Navigator.pushNamed(
            context,
            ProductDetailsScreen.routName,
            arguments: getCurrProduct.PlaceId,
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: FancyShimmerImage(
                imageUrl: getCurrProduct.PlaceImage,
                height: size.height * 0.22,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: TitlesTextWidget(
                      label: getCurrProduct.PlaceTitle,
                      fontSize: 18,
                      maxLines: 2,
                    ),
                  ),Spacer(),
                  Flexible(
                    flex: 2,
                    child: HeartButtonWidget(
                      productId: getCurrProduct.PlaceId,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () async {
                        if (cartProvider.isProdinCart(
                            productId: getCurrProduct.PlaceId)) {
                          return;
                        }
                        try {
                          await cartProvider.addToCartFirebase(
                              productId: getCurrProduct.PlaceId,
                              qty: 1,
                              context: context);
                        } catch (e) {
                          await MyAppFunctions.showErrorOrWarningDialog(
                            context: context,
                            subtitle: e.toString(),
                            fct: () {},
                          );
                        }

                      },
                      splashColor: Colors.red,
                      child: Icon(
                        cartProvider.isProdinCart(
                            productId: getCurrProduct.PlaceId)
                            ? Icons.check
                            : Icons.place_outlined,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                  ),

                ],
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(

                children: [
                  Flexible(
                    flex: 1,
                    child: SubtitleTextWidget(
                      label: "Student:${getCurrProduct.TicketforStudent}\$",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(

                children: [
                  Flexible(
                    flex: 1,
                    child: SubtitleTextWidget(
                      label: "adult:${getCurrProduct.Ticketforadult}\$",
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}